import 'package:dartz/dartz.dart';
import 'package:ebs_application/core/error/failure.dart';
import 'package:ebs_application/domain/entities/product.dart';
import '../repositories/product_repository.dart';

class GetProductsUseCase {
  final ProductRepository repository;

  GetProductsUseCase(this.repository);

  Future<Either<Failure, List<Product>>> execute({int page = 1, int pageSize = 10}) async {
    return await repository.getProducts(page: page, pageSize: pageSize);
  }
}
