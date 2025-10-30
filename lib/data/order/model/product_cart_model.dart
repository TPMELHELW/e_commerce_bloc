import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_bloc/domain/order/entity/product_cart_entity.dart';

class ProductCartModel {
  final String productId;
  final String productTitle;
  final int productQuantity;
  final double productPrice;
  final double totalPrice;
  final String productImage;
  final String productSize;
  final String productColor;

  ProductCartModel({
    required this.productSize,
    required this.productColor,
    required this.productId,
    required this.productTitle,
    required this.productQuantity,
    required this.productPrice,
    required this.totalPrice,
    required this.productImage,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productId': productId,
      'productTitle': productTitle,
      'productQuantity': productQuantity,
      'productColor': productColor,
      'productSize': productSize,
      'productPrice': productPrice,
      'totalPrice': totalPrice,
      'productImage': productImage,
      // 'createdDate': createdDate,
    };
  }

  factory ProductCartModel.formSnapshot(
    QueryDocumentSnapshot<Map<String, dynamic>> data,
  ) {
    final map = data.data();
    return ProductCartModel(
      productId: map['productId'],
      productTitle: map['productTitle'],
      productQuantity: map['productQuantity'],
      productPrice: map['productPrice'],
      totalPrice: map['totalPrice'],
      productImage: map['productImage'],
      productSize: map['productSize'],
      productColor: map['productColor'],
    );
  }

  // final String createdDate;
}

extension ProductCartXModel on ProductCartModel {
  ProductCartEntity toEntity() {
    return ProductCartEntity(
      productId: productId,
      productTitle: productTitle,
      productQuantity: productQuantity,
      productPrice: productPrice,
      totalPrice: totalPrice,
      productImage: productImage,
      productSize: productSize,
      productColor: productColor,
    );
  }
}
