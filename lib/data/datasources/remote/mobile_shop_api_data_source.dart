import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ebs_application/core/error/exceptions.dart';
import 'package:ebs_application/data/models/category_model.dart';
import 'package:ebs_application/data/models/product_model.dart';
import 'package:ebs_application/data/models/review_model.dart';

abstract class MobileShopApiDataSource {
  Future<List<CategoryModel>> getCategories();
  Future<List<ProductModel>> getProducts({int page = 1, int pageSize = 10});
  Future<List<ProductModel>> getBestSellingProducts({
    int page = 1,
    int pageSize = 10,
  });
  Future<ProductModel> getFullProductDetails(int id);
  Future<List<ReviewModel>> getProductReviews(int productId);
  Future<bool> addProductReview(int productId, ReviewModel review);
}

class MobileShopApiDataSourceImpl implements MobileShopApiDataSource {
  final http.Client client;
  final String baseUrl = 'http://mobile-shop-api.hiring.devebs.net';

  MobileShopApiDataSourceImpl({required this.client});

  Map<String, String> get _headers => {'accept': 'application/json'};

  Map<String, String> get _jsonHeaders => {
    'accept': 'application/json',
    'Content-Type': 'application/json',
  };

  @override
  Future<List<CategoryModel>> getCategories() async {
    final response = await client.get(
      Uri.parse('$baseUrl/categories'),
      headers: _headers,
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => CategoryModel.fromJson(json)).toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ProductModel>> getProducts({
    int page = 1,
    int pageSize = 10,
  }) async {
    final response = await client.get(
      Uri.parse('$baseUrl/products').replace(
        queryParameters: {
          'page': page.toString(),
          'page_size': pageSize.toString(),
        },
      ),
      headers: _headers,
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => ProductModel.fromJson(json)).toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ProductModel>> getBestSellingProducts({
    int page = 1,
    int pageSize = 10,
  }) async {
    final response = await client.get(
      Uri.parse('$baseUrl/products/best-sold-products').replace(
        queryParameters: {
          'page': page.toString(),
          'page_size': pageSize.toString(),
        },
      ),
      headers: _headers,
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => ProductModel.fromJson(json)).toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ProductModel> getFullProductDetails(int id) async {
    final response = await client.get(
      Uri.parse('$baseUrl/products/$id'),
      headers: _headers,
    );

    if (response.statusCode == 200) {
      return ProductModel.fromJson(json.decode(response.body));
    } else if (response.statusCode == 404) {
      throw NotFoundException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ReviewModel>> getProductReviews(int productId) async {
    final response = await client.get(
      Uri.parse('$baseUrl/products/$productId/reviews'),
      headers: _headers,
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => ReviewModel.fromJson(json)).toList();
    } else if (response.statusCode == 404) {
      throw NotFoundException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<bool> addProductReview(int productId, ReviewModel review) async {
    final response = await client.post(
      Uri.parse('$baseUrl/products/$productId/add-review'),
      headers: _jsonHeaders,
      body: json.encode(review.toJson()),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else if (response.statusCode == 404) {
      throw NotFoundException();
    } else {
      throw ServerException();
    }
  }
}
