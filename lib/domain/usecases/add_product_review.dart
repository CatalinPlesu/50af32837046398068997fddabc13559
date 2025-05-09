import 'package:ebs_application/domain/entities/review.dart';
import '../repositories/product_repository.dart';

class AddProductReview {
  final ProductRepository repository;

  AddProductReview(this.repository);

  Future<bool> execute(int productId, Review review) async {
    return await repository.addProductReview(productId, review);
  }
}
