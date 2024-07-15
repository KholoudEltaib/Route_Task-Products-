// lib/features/product/domain/repositories/product_repository.dart
import 'package:dartz/dartz.dart';
import '../entities/product_entity.dart';

abstract class ProductRepository {
  Future<Either<Exception, List<ProductEntity>>> getProducts();
}
