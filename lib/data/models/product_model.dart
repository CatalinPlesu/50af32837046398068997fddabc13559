import 'package:ebs_application/domain/entities/product.dart';
import 'package:ebs_application/data/models/category_model.dart';
import 'package:ebs_application/data/models/review_model.dart';

class ProductModel extends Product {
  ProductModel({
    required int id,
    required String name,
    required String details,
    required String size,
    required String color,
    required double price,
    required String mainImageUrl,
    required CategoryModel category,
    required int soldCount,
    required List<String> imagesUrl,
    required List<ReviewModel> reviews,
  }) : super(
    id: id,
    name: name,
    details: details,
    size: size,
    color: color,
    price: price,
    mainImageUrl: mainImageUrl,
    category: category,
    soldCount: soldCount,
    imagesUrl: imagesUrl,
    reviews: reviews,
  );

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    var imagesList = (json['images'] as List?)?.map((i) => i['image'] as String).toList() ?? [];
    var reviewsList = (json['reviews'] as List?)?.map((i) => ReviewModel.fromJson(i as Map<String, dynamic>)).toList() ?? [];
    return ProductModel(
      id: json['id'],
      name: json['name'],
      details: json['details'],
      size: json['size'],
      color: json['colour'],
      price: (json['price'] as num).toDouble(),
      mainImageUrl: json['main_image'],
      category: CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
      soldCount: json['sold_count'] ?? 0,
      imagesUrl: imagesList,
      reviews: reviewsList,
    );
  }
}