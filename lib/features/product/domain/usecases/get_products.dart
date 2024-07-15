// lib/features/product/domain/usecases/get_products.dart
import 'package:dartz/dartz.dart';
import '../entities/product_entity.dart';
import '../repositories/product_repository.dart';

class GetProducts {
  final ProductRepository repository;

  GetProducts({required this.repository});

  Future<Either<Exception, List<ProductEntity>>> call() async {
    return await repository.getProducts();
  }
}
