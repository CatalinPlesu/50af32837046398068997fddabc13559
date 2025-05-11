import 'package:ebs_application/domain/entities/review.dart';
import '../repositories/product_repository.dart';

class AddProductReviewUseCase {
  final ProductRepository repository;

  AddProductReviewUseCase(this.repository);

  Future<bool> execute(int productId, Review review) async {
    return await repository.addProductReview(productId, review);
  }
}
