// lib/features/product/data/models/product_model.dart
import 'package:equatable/equatable.dart';
import 'package:rout_task_products/features/product/domain/entities/product_entity.dart';

class ProductModel extends Equatable {
  final int id;
  final String title;
  final double price;
  final String image;
  final double discountPercentage;
  final List<dynamic> reviews;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.discountPercentage,
    required this.reviews,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      image: json['images'][0],
      discountPercentage: json['discountPercentage'].toDouble(),
      reviews: json['reviews'],
    );
  }

  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      title: title,
      price: price,
      image: image,
      discountPercentage: discountPercentage,
      reviews: reviews,
    );
  }

  @override
  List<Object> get props =>
      [id, title, price, image, discountPercentage, reviews];
}
