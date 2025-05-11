import 'package:dartz/dartz.dart';
import 'package:ebs_application/core/error/failure.dart';
import 'package:ebs_application/data/datasources/remote/mobile_shop_api_data_source.dart';
import 'package:ebs_application/domain/entities/category.dart';
import 'package:ebs_application/domain/repositories/category_repository.dart';
import 'package:ebs_application/core/network/network_info.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final MobileShopApiDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  CategoryRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Category>>> getCategories() async {
    if (await networkInfo.isConnected) {
      try {
        final categories = await remoteDataSource.getCategories();
        return Right(categories.map((model) => model.toEntity()).toList());
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
