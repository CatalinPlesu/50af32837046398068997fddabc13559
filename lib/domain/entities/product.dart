import 'category.dart';
import 'review.dart';

class Product {
  final int id;
  final String name;
  final String details;
  final String size;
  final String color;
  final double price;
  final String mainImageUrl;
  final Category category;
  final int soldCount;
  final List<String> imagesUrl;
  final List<ProductReview> reviews;


  const Product({
    required this.id,
    required this.name,
    required this.details,
    required this.size,
    required this.color,
    required this.price,
    required this.mainImageUrl,
    required this.category,
    required this.soldCount,
    required this.imagesUrl,
    required this.reviews,
  });
}
