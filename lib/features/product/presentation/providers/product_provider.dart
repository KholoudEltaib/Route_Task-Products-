// lib/features/product/presentation/providers/product_provider.dart
import 'package:flutter/material.dart';
import 'package:rout_task_products/features/product/data/models/product_model.dart';
import 'package:rout_task_products/features/product/domain/repositories/product_repository.dart'; // Import the correct ProductRepository interface

class ProductProvider extends ChangeNotifier {
  final ProductRepository repository; // Use the correct interface

  ProductProvider({required this.repository});

  List<ProductModel> _products = [];
  List<ProductModel> get products => _products;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> loadProducts() async {
    _isLoading = true;
    notifyListeners();

    try {
      final productEntitiesResult = await repository.getProducts();
      productEntitiesResult.fold(
        (error) {
          // Handle error appropriately
          print('Error: $error');
        },
        (productEntities) {
          _products = productEntities
              .map((entity) => ProductModel(
                    id: entity.id,
                    title: entity.title,
                    price: entity.price,
                    image: entity.image,
                    discountPercentage: entity.discountPercentage,
                    reviews: entity.reviews,
                  ))
              .toList();
        },
      );
    } catch (e) {
      // Handle errors appropriately
      print('Exception: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
