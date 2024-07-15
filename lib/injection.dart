// lib/di/injection.dart

import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:rout_task_products/features/product/data/datasources/product_remote_datasource.dart';
import 'package:rout_task_products/features/product/data/repositories/product_repository_impl.dart';
import 'package:rout_task_products/features/product/domain/repositories/product_repository.dart';
import 'package:rout_task_products/features/product/domain/usecases/get_products.dart';
import 'package:rout_task_products/features/product/presentation/blocs/product_bloc.dart';

final GetIt sl = GetIt.instance;

void init() {
  // Register data sources
  sl.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl(client: http.Client()));

  // Register repositories
  sl.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(remoteDataSource: sl()));

  // Register use cases
  sl.registerLazySingleton<GetProducts>(() => GetProducts(repository: sl()));

  // Register blocs
  sl.registerFactory(() => ProductBloc(getProducts: sl()));
}
