// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_bloc/domain/product/entity/product_entity.dart';

class ProductModel {
  final String categoryId;
  // final Timestamp createdDate;
  final int discountedPrice;
  final String gender;
  final List<String> images;
  final int price;
  // final List<String> sizes;
  final String productId;
  final int salesNumber;
  final String title;

  ProductModel({
    required this.categoryId,
    // required this.createdDate,
    required this.discountedPrice,
    required this.gender,
    required this.images,
    required this.price,
    // required this.sizes,
    required this.productId,
    required this.salesNumber,
    required this.title,
  });

  factory ProductModel.fromSnapshot(
    QueryDocumentSnapshot<Map<String, dynamic>> data,
  ) {
    final map = data.data();
    return ProductModel(
      categoryId: map['categoryId'] as String,
      // createdDate: map['createdDate'] as Timestamp,
      discountedPrice: map['discountedPrice'],
      gender: map['gender'] as String,
      images: List<String>.from(map['images'].map((e) => e.toString())),
      price: map['price'],
      // sizes: List<String>.from(map['sizes'].map((e) => e.toString())),
      productId: data.id,
      salesNumber: map['salesNumber'] as int,
      title: map['title'] as String,
    );
  }
}

extension ProductXModel on ProductModel {
  ProductEntity toEntity() {
    return ProductEntity(
      categoryId: categoryId,
      // createdDate: createdDate,
      discountedPrice: discountedPrice,
      gender: gender,
      images: images,
      price: price,
      // sizes: sizes,
      productId: productId,
      salesNumber: salesNumber,
      title: title,
    );
  }
}
