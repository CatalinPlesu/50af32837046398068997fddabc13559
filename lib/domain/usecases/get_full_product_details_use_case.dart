import 'package:dartz/dartz.dart';
import 'package:ebs_application/core/error/failure.dart';
import 'package:ebs_application/domain/entities/product.dart';
import '../repositories/product_repository.dart';

class GetFullProductDetailsUseCase {
  final ProductRepository repository;

  GetFullProductDetailsUseCase(this.repository);

  Future<Either<Failure, Product>> execute(int id) async {
    return await repository.getFullProductDetails(id);
  }
}
