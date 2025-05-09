// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  details: json['details'] as String,
  size: json['size'] as String,
  color: json['colour'] as String,
  price: (json['price'] as num).toDouble(),
  mainImageUrl: json['main_image'] as String,
  category: CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
  soldCount: (json['sold_count'] as num).toInt(),
  imagesUrl: (json['images'] as List<dynamic>).map((e) => e as String).toList(),
  reviews:
      (json['reviews'] as List<dynamic>)
          .map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'details': instance.details,
      'size': instance.size,
      'colour': instance.color,
      'price': instance.price,
      'main_image': instance.mainImageUrl,
      'category': instance.category,
      'sold_count': instance.soldCount,
      'images': instance.imagesUrl,
      'reviews': instance.reviews,
    };
