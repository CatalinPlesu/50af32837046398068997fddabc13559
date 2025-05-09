import 'package:dartz/dartz.dart';
import 'package:ebs_application/core/error/failure.dart';
import 'package:ebs_application/domain/entities/product.dart';
import '../repositories/product_repository.dart';

class GetBestSellingProducts {
  final ProductRepository repository;

  GetBestSellingProducts(this.repository);

  Future<Either<Failure, List<Product>>> execute({int page = 1, int pageSize = 10}) async {
    return await repository.getBestSellingProducts(page: page, pageSize: pageSize);
  }
}
