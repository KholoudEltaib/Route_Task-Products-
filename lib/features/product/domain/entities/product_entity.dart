// lib/features/product/domain/entities/product_entity.dart
class ProductEntity {
  final int id;
  final String title;
  final double price;
  final String image;
  final double discountPercentage;
  final List<dynamic> reviews;

  ProductEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.discountPercentage,
    required this.reviews,
  });
}
