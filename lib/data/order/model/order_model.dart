import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_bloc/data/order/model/product_cart_model.dart';
import 'package:e_commerce_bloc/domain/order/entity/order_entity.dart';

class OrderModel {
  final List<ProductCartModel> products;
  final String createdDate;
  final String shippingAddress;
  final int itemCount;
  final double totalPrice;
  final int order;

  OrderModel({
    required this.order,
    required this.products,
    required this.createdDate,
    required this.itemCount,
    required this.totalPrice,
    required this.shippingAddress,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'products': products.map((e) => e.toMap()).toList(),
      'createdDate': createdDate,
      'itemCount': itemCount,
      'totalPrice': totalPrice,
      'shippingAddress': shippingAddress,
      'order': order,
    };
  }

  factory OrderModel.fromSnapshot(
    QueryDocumentSnapshot<Map<String, dynamic>> data,
  ) {
    final finalData = data.data();
    return OrderModel(
      products: List<ProductCartModel>.from(
        finalData['products'].map((e) => ProductCartModel.fromMap(e)),
      ),
      createdDate: finalData['createdDate'],
      itemCount: finalData['itemCount'],
      totalPrice: finalData['totalPrice'],
      shippingAddress: finalData['shippingAddress'],
      order: finalData['code'] ?? 0000000,
    );
  }
}

extension OrderXEntity on OrderModel {
  OrderEntity toEntity() {
    return OrderEntity(
      products: products.map((e) => e.toEntity()).toList(),
      createdDate: createdDate,
      itemCount: itemCount,
      totalPrice: totalPrice,
      shippingAddress: shippingAddress,
      order: order,
    );
  }
}
