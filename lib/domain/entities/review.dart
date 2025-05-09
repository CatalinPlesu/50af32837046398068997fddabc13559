// lib/domain/entities/product_review.dart
class ProductReview {
  final int id;
  final DateTime createdAt;
  final DateTime modifiedAt;
  final String firstName;
  final String lastName;
  final String? imageUrl;
  final int rating;
  final String message;

  const ProductReview({
    required this.id,
    required this.createdAt,
    required this.modifiedAt,
    required this.firstName,
    required this.lastName,
    this.imageUrl,
    required this.rating,
    required this.message,
  });
}