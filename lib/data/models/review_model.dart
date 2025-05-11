import 'package:ebs_application/domain/entities/review.dart';
import 'package:json_annotation/json_annotation.dart';

part 'review_model.g.dart';

@JsonSerializable()
class ReviewModel {
  final int id;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'modified_at')
  final DateTime modifiedAt;
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'last_name')
  final String lastName;
  final String image;
  final double rating;
  final String message;

  ReviewModel({
    required this.id,
    required this.createdAt,
    required this.modifiedAt,
    required this.firstName,
    required this.lastName,
    required this.image,
    required this.rating,
    required this.message,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewModelToJson(this);

  Review toEntity() {
    return Review(
      id: id,
      createdAt: createdAt,
      modifiedAt: modifiedAt,
      firstName: firstName,
      lastName: lastName,
      image: image,
      rating: rating,
      message: message,
    );
  }

  factory ReviewModel.fromEntity(Review review) {
    return ReviewModel(
      id: review.id,
      createdAt: review.createdAt,
      modifiedAt: review.modifiedAt,
      firstName: review.firstName,
      lastName: review.lastName,
      image: review.image,
      rating: review.rating,
      message: review.message,
    );
  }
}
