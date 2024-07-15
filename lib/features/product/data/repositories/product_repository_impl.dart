// lib/features/product/data/repositories/product_repository_impl.dart
import 'package:dartz/dartz.dart';
import 'package:rout_task_products/features/product/data/datasources/product_remote_datasource.dart';
import 'package:rout_task_products/features/product/domain/entities/product_entity.dart';
import 'package:rout_task_products/features/product/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Exception, List<ProductEntity>>> getProducts() async {
    try {
      final productModels = await remoteDataSource.fetchProducts();
      final productEntities =
          productModels.map((model) => model.toEntity()).toList();
      return Right(productEntities);
    } catch (e) {
      return Left(Exception('Failed to fetch products'));
    }
  }
}
