import 'package:dartz/dartz.dart';
import 'package:ebs_application/core/error/failure.dart';
import 'package:ebs_application/domain/entities/category.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<Category>>> getCategories();
}