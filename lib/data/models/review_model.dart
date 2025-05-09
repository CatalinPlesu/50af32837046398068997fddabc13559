import 'package:ebs_application/domain/entities/review.dart';

class ReviewModel extends Review {
  ReviewModel({
    required int id,
    required DateTime createdAt,
    required DateTime modifiedAt,
    required String firstName,
    required String lastName,
    String? imageUrl,
    required int rating,
    required String message,
  }) : super(
    id: id,
    createdAt: createdAt,
    modifiedAt: modifiedAt,
    firstName: firstName,
    lastName: lastName,
    imageUrl: imageUrl,
    rating: rating,
    message: message,
  );

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json["id"],
      createdAt: DateTime.parse(json["created_at"]),
      modifiedAt: DateTime.parse(json["modified_at"]),
      firstName: json["first_name"],
      lastName: json["last_name"],
      imageUrl: json["image"],
      rating: json["rating"],
      message: json["message"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "created_at": createdAt.toIso8601String(),
      "modified_at": modifiedAt.toIso8601String(),
      "first_name": firstName,
      "last_name": lastName,
      "image": imageUrl,
      "rating": rating,
      "message": message,
    };
  }
}