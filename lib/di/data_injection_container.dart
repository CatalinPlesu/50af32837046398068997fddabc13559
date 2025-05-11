import 'package:ebs_application/data/datasources/local/database/app_database.dart';
import 'package:ebs_application/data/datasources/local/mobile_shop_local_data_source.dart';
import 'package:ebs_application/data/datasources/remote/mobile_shop_api_data_source.dart';
import 'package:ebs_application/data/repositories/category_repository_impl.dart';
import 'package:ebs_application/data/repositories/product_repository_impl.dart';
import 'package:ebs_application/domain/repositories/category_repository.dart';
import 'package:ebs_application/domain/repositories/product_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../core/network/network_info.dart';

Future initData() async {
  var getIt = GetIt.instance;

  //External
  getIt.registerLazySingleton(() => http.Client());
  final internetConnectionChecker = InternetConnectionChecker.createInstance();
  getIt.registerLazySingleton(() => internetConnectionChecker);

  //! Core
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(connectionChecker: getIt()));

  //Database
  getIt.registerLazySingleton(() => AppDatabase());

  //DataSources
  getIt.registerLazySingleton<MobileShopApiDataSource>(() => MobileShopApiDataSourceImpl(client: getIt()));
  getIt.registerLazySingleton<MobileShopLocalDataSource>(() => MobileShopLocalDataSourceImpl(database: getIt()));

  //Repositories
  getIt.registerLazySingleton<CategoryRepository>(
          () => CategoryRepositoryImpl(remoteDataSource: getIt(), networkInfo: getIt()));
  getIt.registerLazySingleton<ProductRepository>(
          () => ProductRepositoryImpl(remoteDataSource: getIt(), localDataSource: getIt(), networkInfo: getIt()));
}