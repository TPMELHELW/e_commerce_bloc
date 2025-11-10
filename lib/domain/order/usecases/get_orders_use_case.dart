import 'package:dartz/dartz.dart';
import 'package:e_commerce_bloc/core/usecase/usecase.dart';
import 'package:e_commerce_bloc/domain/order/entity/order_entity.dart';
import 'package:e_commerce_bloc/domain/order/repository/order_repository.dart';
import 'package:e_commerce_bloc/services_locator.dart';

class GetOrdersUseCase
    implements Usecase<Either<String, List<OrderEntity>>, dynamic> {
  @override
  Future<Either<String, List<OrderEntity>>> call({params}) async {
    return await sl<OrderRepository>().getOrders();
  }
}
