import 'package:e_commerce_bloc/domain/order/entity/order_entity.dart';

abstract class OrderState {}

class OrderLoadingState extends OrderState {}

class OrderLoadedState extends OrderState {
  final List<OrderEntity> orders;

  OrderLoadedState({required this.orders});
}

class OrderFailureState extends OrderState {}
