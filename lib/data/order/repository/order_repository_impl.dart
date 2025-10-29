import 'package:dartz/dartz.dart';
import 'package:e_commerce_bloc/data/order/model/product_cart_model.dart';
import 'package:e_commerce_bloc/data/order/sources/order_firestore_services.dart';
// import 'package:e_commerce_bloc/data/product/model/product_model.dart';
import 'package:e_commerce_bloc/domain/order/repository/order_repository.dart';
import 'package:e_commerce_bloc/services_locator.dart';

class OrderRepositoryImpl extends OrderRepository {
  @override
  Future<Either> addtoCart(ProductCartModel product) async {
    return await sl<OrderFirestoreServices>().addToCart(product);
  }
}
