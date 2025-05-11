import 'package:dartz/dartz.dart';
import 'package:ebs_application/core/error/failure.dart';
import 'package:ebs_application/domain/entities/category.dart';

import '../repositories/category_repository.dart';

class GetCategoriesUseCase {
  final CategoryRepository repository;

  GetCategoriesUseCase(this.repository);

  Future<Either<Failure, List<Category>>> execute() async {
    return await repository.getCategories();
  }
}
