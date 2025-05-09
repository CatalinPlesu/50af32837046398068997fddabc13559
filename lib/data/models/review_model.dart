import 'package:ebs_application/domain/entities/review.dart';
import 'package:json_annotation/json_annotation.dart';

part 'review_model.g.dart';

@JsonSerializable()
class ReviewModel {
  final int id;
  @JsonKey(name: 'product_id')
  final int productId;
  @JsonKey(name: 'user_id')
  final int userId;
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'last_name')
  final String lastName;
  @JsonKey(name: 'user_image')
  final String userImage;
  final double rating;
  final String comment;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'modified_at')
  final DateTime modifiedAt;

  ReviewModel({
    required this.id,
    required this.productId,
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.userImage,
    required this.rating,
    required this.comment,
    required this.createdAt,
    required this.modifiedAt,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewModelToJson(this);

  Review toEntity() {
    return Review(
      id: id,
      productId: productId,
      userId: userId,
      firstName: firstName,
      lastName: lastName,
      userImage: userImage,
      rating: rating,
      comment: comment,
      createdAt: createdAt,
      modifiedAt: modifiedAt,
    );
  }

  factory ReviewModel.fromEntity(Review review) {
    return ReviewModel(
      id: review.id,
      productId: review.productId,
      userId: review.userId,
      firstName: review.firstName,
      lastName: review.lastName,
      userImage: review.userImage,
      rating: review.rating,
      comment: review.comment,
      createdAt: review.createdAt,
      modifiedAt: review.modifiedAt,
    );
  }
}
