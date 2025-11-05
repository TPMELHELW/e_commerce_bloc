// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:e_commerce_bloc/data/order/model/product_cart_model.dart';
import 'package:e_commerce_bloc/domain/order/entity/product_cart_entity.dart';
// import 'package:ecommerce/data/order/models/product_ordered.dart';

// import '../../../domain/order/entities/product_ordered.dart';

class OrderModel {
  final List<ProductCartEntity> products;
  final String createdDate;
  final String shippingAddress;
  final int itemCount;
  final double totalPrice;

  OrderModel({
    required this.products,
    required this.createdDate,
    required this.itemCount,
    required this.totalPrice,
    required this.shippingAddress,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'products': products.map((e) => e.toModel().toMap()).toList(),
      'createdDate': createdDate,
      'itemCount': itemCount,
      'totalPrice': totalPrice,
      'shippingAddress': shippingAddress,
    };
  }
}
