import 'package:dartz/dartz.dart';
import 'package:e_commerce_bloc/data/order/model/order_model.dart';
import 'package:e_commerce_bloc/data/order/model/product_cart_model.dart';
import 'package:e_commerce_bloc/domain/order/entity/product_cart_entity.dart';
// import 'package:e_commerce_bloc/data/product/model/product_model.dart';

abstract class OrderRepository {
  Future<Either<String, String>> addtoCart(ProductCartModel product);
  Future<Either<String, List<ProductCartEntity>>> getCartProducts();
  Future<Either<String, String>> removeFromCart(String productId);
  Future<Either<String, String>> addOrder(OrderModel product);
}
