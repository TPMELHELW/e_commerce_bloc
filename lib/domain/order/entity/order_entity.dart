import 'package:e_commerce_bloc/domain/order/entity/product_cart_entity.dart';

class OrderEntity {
  final List<ProductCartEntity> products;
  final String createdDate;
  final String shippingAddress;
  final int itemCount;
  final double totalPrice;
  final int order;

  OrderEntity({
    required this.order,
    required this.products,
    required this.createdDate,
    required this.itemCount,
    required this.totalPrice,
    required this.shippingAddress,
  });
}
