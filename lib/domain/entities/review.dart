import 'package:equatable/equatable.dart';

class Review extends Equatable {
  final int id;
  final int productId;
  final int userId;
  final String firstName;
  final String lastName;
  final String userImage;
  final double rating;
  final String comment;
  final DateTime createdAt;
  final DateTime modifiedAt;

  const Review({
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

  @override
  List<Object> get props => [
    id,
    productId,
    userId,
    firstName,
    lastName,
    userImage,
    rating,
    comment,
    createdAt,
    modifiedAt,
  ];
}
