import 'package:dartz/dartz.dart';
import 'package:e_commerce_bloc/data/order/model/order_model.dart';
import 'package:e_commerce_bloc/data/order/model/product_cart_model.dart';
import 'package:e_commerce_bloc/data/order/sources/order_firestore_services.dart';
import 'package:e_commerce_bloc/domain/order/entity/order_entity.dart';
import 'package:e_commerce_bloc/domain/order/entity/product_cart_entity.dart';
import 'package:e_commerce_bloc/domain/order/repository/order_repository.dart';
import 'package:e_commerce_bloc/services_locator.dart';

class OrderRepositoryImpl extends OrderRepository {
  @override
  Future<Either<String, String>> addtoCart(ProductCartModel product) async {
    return await sl<OrderFirestoreServices>().addToCart(product);
  }

  @override
  Future<Either<String, List<ProductCartEntity>>> getCartProducts() async {
    final data = await sl<OrderFirestoreServices>().getCartProduct();

    return data.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(
          data.map((e) => ProductCartModel.formSnapshot(e).toEntity()).toList(),
        );
      },
    );
  }

  @override
  Future<Either<String, String>> removeFromCart(String productId) async {
    return await sl<OrderFirestoreServices>().removeFromCart(productId);
  }

  @override
  Future<Either<String, String>> addOrder(OrderModel product) async {
    return await sl<OrderFirestoreServices>().addOrder(product);
  }

  @override
  Future<Either<String, List<OrderEntity>>> getOrders() async {
    final data = await sl<OrderFirestoreServices>().getOrders();
    return data.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(
          data.map((e) => OrderModel.fromSnapshot(e).toEntity()).toList(),
        );
      },
    );
    // return await sl<OrderFirestoreServices>().getOrders();
  }
}
