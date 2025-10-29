import 'package:dartz/dartz.dart';
import 'package:e_commerce_bloc/core/usecase/usecase.dart';
import 'package:e_commerce_bloc/data/order/model/product_cart_model.dart';
import 'package:e_commerce_bloc/domain/order/repository/order_repository.dart';
import 'package:e_commerce_bloc/services_locator.dart';

class AddToCartUseCase implements Usecase<Either, ProductCartModel> {
  @override
  Future<Either> call({ProductCartModel? params}) async {
    return await sl<OrderRepository>().addtoCart(params!);
  }
}
