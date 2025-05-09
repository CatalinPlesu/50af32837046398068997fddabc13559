import 'package:dartz/dartz.dart';
import 'package:ebs_application/core/error/failure.dart';
import 'package:ebs_application/domain/entities/product.dart';

import '../entities/review.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getProducts({int page = 1, int pageSize = 10});
  Future<Either<Failure, List<Product>>> getBestSellingProducts({int page = 1, int pageSize = 10});
  Future<Either<Failure, Product>> getFullProductDetails(int id);
  Future<bool> addProductReview(int productId, Review review);
}
