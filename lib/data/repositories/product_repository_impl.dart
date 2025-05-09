import 'package:dartz/dartz.dart';
import 'package:ebs_application/core/error/failure.dart';
import 'package:ebs_application/data/datasources/remote/mobile_shop_api_data_source.dart';
import 'package:ebs_application/data/datasources/local/mobile_shop_local_data_source.dart';
import 'package:ebs_application/data/models/product_model.dart';
import 'package:ebs_application/data/models/review_model.dart';
import 'package:ebs_application/domain/entities/product.dart';
import 'package:ebs_application/domain/entities/review.dart';
import 'package:ebs_application/domain/repositories/product_repository.dart';
import 'package:ebs_application/core/platform/network_info.dart';

class ProductRepositoryImpl implements ProductRepository {
  final MobileShopApiDataSource remoteDataSource;
  final MobileShopLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  ProductRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Product>>> getProducts({int page = 1, int pageSize = 10}) async {
    if (await networkInfo.isConnected) {
      try {
        final products = await remoteDataSource.getProducts(page: page, pageSize: pageSize);
        await localDataSource.insertProducts(products);
        return Right(products.map((model) => model.toEntity()).toList());
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      try {
        final products = await localDataSource.getProducts();
        return Right(products.map((model) => model.toEntity()).toList());
      } catch (e) {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getBestSellingProducts({int page = 1, int pageSize = 10}) async {
    if (await networkInfo.isConnected) {
      try {
        final products = await remoteDataSource.getBestSellingProducts(page: page, pageSize: pageSize);
        await localDataSource.insertProducts(products);
        return Right(products.map((model) => model.toEntity()).toList());
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      try {
        final products = await localDataSource.getBestSellingProducts();
        return Right(products.map((model) => model.toEntity()).toList());
      } catch (e) {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Product>> getFullProductDetails(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final product = await remoteDataSource.getFullProductDetails(id);
        return Right(product.toEntity());
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      try {
        final product = await localDataSource.getFullProductDetails(id);
        if (product == null) {
          return Left(CacheFailure());
        }
        return Right(product.toEntity());
      } catch (e) {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<bool> addProductReview(int productId, Review review) async {
    if (await networkInfo.isConnected) {
      try {
        final reviewModel = ReviewModel(
          id: review.id,
          productId: review.productId,
          userId: review.userId,
          firstName: review.firstName,
          lastName: review.lastName,
          userImage: review.userImage,
          rating: review.rating,
          comment: review.comment,
          createdAt: review.createdAt,
          modifiedAt: review.modifiedAt,
        );
        final result = await remoteDataSource.addProductReview(productId, reviewModel);
        if (result) {
          await localDataSource.insertReview(reviewModel);
        }
        return result;
      } catch (e) {
        return false;
      }
    } else {
      return false;
    }
  }
}