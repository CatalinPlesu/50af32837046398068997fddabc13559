// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) => ReviewModel(
  id: (json['id'] as num).toInt(),
  createdAt: DateTime.parse(json['created_at'] as String),
  modifiedAt: DateTime.parse(json['modified_at'] as String),
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  image: json['image'] as String,
  rating: (json['rating'] as num).toDouble(),
  message: json['message'] as String,
);

Map<String, dynamic> _$ReviewModelToJson(ReviewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'modified_at': instance.modifiedAt.toIso8601String(),
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'image': instance.image,
      'rating': instance.rating,
      'message': instance.message,
    };
