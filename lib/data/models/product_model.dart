import 'package:ebs_application/domain/entities/product.dart';
import 'package:ebs_application/data/models/category_model.dart';
import 'package:ebs_application/data/models/review_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  final int id;
  final String name;
  final String details;
  final String size;
  final String colour;
  final double price;
  @JsonKey(name: 'main_image')
  final String mainImage;
  final CategoryModel category;
  @JsonKey(name: 'sold_count')
  final int? soldCount;
  final List<String>? images;
  final List<ReviewModel>? reviews;

  ProductModel({
    required this.id,
    required this.name,
    required this.details,
    required this.size,
    required this.colour,
    required this.price,
    required this.mainImage,
    required this.category,
    required this.soldCount,
    required this.images,
    required this.reviews,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  Product toEntity() {
    return Product(
      id: id,
      name: name,
      details: details,
      size: size,
      colour: colour,
      price: price,
      mainImage: mainImage,
      category: category.toEntity(),
      soldCount: soldCount,
      images: images ?? [],
      reviews: reviews?.map((review) => review.toEntity()).toList() ?? [],
    );
  }

  factory ProductModel.fromEntity(Product product) {
    return ProductModel(
      id: product.id,
      name: product.name,
      details: product.details,
      size: product.size,
      colour: product.colour,
      price: product.price,
      mainImage: product.mainImage,
      category: CategoryModel.fromEntity(product.category),
      soldCount: product.soldCount,
      images: product.images,
      reviews: product.reviews.map((review) => ReviewModel.fromEntity(review)).toList(),
    );
  }
}

@JsonSerializable()
class ProductResponseModel {
  final List<ProductModel> results;

  ProductResponseModel({
    required this.results,
  });

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseModelToJson(this);
}