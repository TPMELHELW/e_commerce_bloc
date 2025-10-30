import 'package:e_commerce_bloc/domain/order/entity/product_cart_entity.dart';

class CartHelper {
  static double calculateCartSubtotal(List<ProductCartEntity> products) {
    double subtotalPrice = 0;
    for (var item in products) {
      subtotalPrice = subtotalPrice + item.totalPrice;
    }
    return subtotalPrice;
  }
}
