import 'package:dartz/dartz.dart';
import 'package:e_commerce_bloc/core/usecase/usecase.dart';
import 'package:e_commerce_bloc/data/order/model/order_model.dart';
import 'package:e_commerce_bloc/domain/order/entity/product_cart_entity.dart';
import 'package:e_commerce_bloc/domain/order/repository/order_repository.dart';
import 'package:e_commerce_bloc/services_locator.dart';

class AddOrderUseCase implements Usecase<Either, OrderModel> {
  @override
  Future<Either> call({OrderModel? params}) async {
    return await sl<OrderRepository>().addOrder(params!);
  }
}
