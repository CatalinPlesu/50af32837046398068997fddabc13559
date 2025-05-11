import 'package:equatable/equatable.dart';

import 'category.dart';
import 'review.dart';

class Product extends Equatable{
  final int id;
  final String name;
  final String details;
  final String size;
  final String colour;
  final double price;
  final String mainImage;
  final Category category;
  final int? soldCount;
  final List<String> images;
  final List<Review> reviews;


  const Product({
    required this.id,
    required this.name,
    required this.details,
    required this.size,
    required this.colour,
    required this.price,
    required this.mainImage,
    required this.category,
    required this.soldCount,
    required this.images,
    required this.reviews,
  });

  @override
  List<Object> get props => [name, size, colour, category];
}
