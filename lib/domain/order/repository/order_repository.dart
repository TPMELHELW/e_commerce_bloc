import 'package:dartz/dartz.dart';
import 'package:e_commerce_bloc/data/order/model/product_cart_model.dart';
import 'package:e_commerce_bloc/domain/order/entity/product_cart_entity.dart';
// import 'package:e_commerce_bloc/data/product/model/product_model.dart';

abstract class OrderRepository {
  Future<Either> addtoCart(ProductCartModel product);
  Future<Either<String, List<ProductCartEntity>>> getCartProducts();
  Future<Either> removeFromCart(String productId);
}
