import 'package:ebs_application/domain/entities/product.dart';
import 'package:ebs_application/data/models/category_model.dart';
import 'package:ebs_application/data/models/review_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

class CategoryConverter implements JsonConverter<CategoryModel, Map<String, dynamic>> {
  const CategoryConverter();

  @override
  CategoryModel fromJson(Map<String, dynamic> json) => CategoryModel.fromJson(json);

  @override
  Map<String, dynamic> toJson(CategoryModel category) => category.toJson();
}

class ReviewsConverter implements JsonConverter<List<ReviewModel>, List<dynamic>> {
  const ReviewsConverter();

  @override
  List<ReviewModel> fromJson(List<dynamic> json) =>
      json.map((e) => ReviewModel.fromJson(e as Map<String, dynamic>)).toList();

  @override
  List<Map<String, dynamic>> toJson(List<ReviewModel> reviews) =>
      reviews.map((e) => e.toJson()).toList();
}

@JsonSerializable()
class ProductModel {
  final int id;
  final String name;
  final String details;
  final String size;
  @JsonKey(name: 'colour')
  final String color;
  final double price;
  @JsonKey(name: 'main_image')
  final String mainImageUrl;
  @JsonKey(name: 'category')
  final CategoryModel category;
  @JsonKey(name: 'sold_count')
  final int soldCount;
  @JsonKey(name: 'images')
  final List<String> imagesUrl;
  @JsonKey(name: 'reviews')
  final List<ReviewModel> reviews;

  ProductModel({
    required this.id,
    required this.name,
    required this.details,
    required this.size,
    required this.color,
    required this.price,
    required this.mainImageUrl,
    required this.category,
    required this.soldCount,
    required this.imagesUrl,
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
      color: color,
      price: price,
      mainImageUrl: mainImageUrl,
      category: category.toEntity(),
      soldCount: soldCount,
      imagesUrl: imagesUrl,
      reviews: reviews.map((review) => review.toEntity()).toList(),
    );
  }

  factory ProductModel.fromEntity(Product product) {
    return ProductModel(
      id: product.id,
      name: product.name,
      details: product.details,
      size: product.size,
      color: product.color,
      price: product.price,
      mainImageUrl: product.mainImageUrl,
      category: CategoryModel.fromEntity(product.category),
      soldCount: product.soldCount,
      imagesUrl: product.imagesUrl,
      reviews: product.reviews.map((review) => ReviewModel.fromEntity(review)).toList(),
    );
  }
}