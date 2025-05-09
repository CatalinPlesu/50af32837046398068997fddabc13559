// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) => ReviewModel(
  id: (json['id'] as num).toInt(),
  productId: (json['product_id'] as num).toInt(),
  userId: (json['user_id'] as num).toInt(),
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  userImage: json['user_image'] as String,
  rating: (json['rating'] as num).toDouble(),
  comment: json['comment'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  modifiedAt: DateTime.parse(json['modified_at'] as String),
);

Map<String, dynamic> _$ReviewModelToJson(ReviewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'user_id': instance.userId,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'user_image': instance.userImage,
      'rating': instance.rating,
      'comment': instance.comment,
      'created_at': instance.createdAt.toIso8601String(),
      'modified_at': instance.modifiedAt.toIso8601String(),
    };
