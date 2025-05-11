import 'package:ebs_application/domain/repositories/category_repository.dart';
import 'package:ebs_application/domain/repositories/product_repository.dart';
import 'package:ebs_application/domain/usecases/add_product_review_use_case.dart';
import 'package:ebs_application/domain/usecases/get_best_selling_products_use_case.dart';
import 'package:ebs_application/domain/usecases/get_categories_use_case.dart';
import 'package:ebs_application/domain/usecases/get_full_product_details_use_case.dart';
import 'package:ebs_application/domain/usecases/get_products_use_case.dart';
import 'package:get_it/get_it.dart';

Future initDomain() async {
  var getIt = GetIt.instance;

  getIt.registerLazySingleton<AddProductReviewUseCase>(() => AddProductReviewUseCase(getIt.get<ProductRepository>()));
  getIt.registerLazySingleton<GetBestSellingProductsUseCase>(() =>GetBestSellingProductsUseCase(getIt.get<ProductRepository>()));
  getIt.registerLazySingleton<GetCategoriesUseCase>(() =>GetCategoriesUseCase(getIt.get<CategoryRepository>()));
  getIt.registerLazySingleton<GetFullProductDetailsUseCase>(() =>GetFullProductDetailsUseCase(getIt.get<ProductRepository>()));
  getIt.registerLazySingleton<GetProductsUseCase>(() =>GetProductsUseCase(getIt.get<ProductRepository>()));
}