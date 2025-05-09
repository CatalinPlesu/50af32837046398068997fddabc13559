import 'package:equatable/equatable.dart';

class Review extends Equatable{
  final int id;
  final DateTime createdAt;
  final DateTime modifiedAt;
  final String firstName;
  final String lastName;
  final String? imageUrl;
  final int rating;
  final String message;

  const Review({
    required this.id,
    required this.createdAt,
    required this.modifiedAt,
    required this.firstName,
    required this.lastName,
    this.imageUrl,
    required this.rating,
    required this.message,
  });

  @override
  List<Object> get props => [id, createdAt, firstName, lastName];
}