import 'package:equatable/equatable.dart';

class Review extends Equatable {
  final int id;
  final DateTime createdAt;
  final DateTime modifiedAt;
  final String firstName;
  final String lastName;
  final String image;
  final double rating;
  final String message;

  const Review({
    required this.id,
    required this.createdAt,
    required this.modifiedAt,
    required this.firstName,
    required this.lastName,
    required this.image,
    required this.rating,
    required this.message,
  });

  @override
  List<Object> get props => [
    id,
    createdAt,
    modifiedAt,
    firstName,
    lastName,
    image,
    rating,
    message,
  ];
}