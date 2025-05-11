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
  colour: json['colour'] as String,
  price: (json['price'] as num).toDouble(),
  mainImage: json['main_image'] as String,
  category: CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
  soldCount: (json['sold_count'] as num?)?.toInt(),
  images: (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
  reviews:
      (json['reviews'] as List<dynamic>?)
          ?.map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'details': instance.details,
      'size': instance.size,
      'colour': instance.colour,
      'price': instance.price,
      'main_image': instance.mainImage,
      'category': instance.category,
      'sold_count': instance.soldCount,
      'images': instance.images,
      'reviews': instance.reviews,
    };

ProductResponseModel _$ProductResponseModelFromJson(
  Map<String, dynamic> json,
) => ProductResponseModel(
  results:
      (json['results'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$ProductResponseModelToJson(
  ProductResponseModel instance,
) => <String, dynamic>{'results': instance.results};
