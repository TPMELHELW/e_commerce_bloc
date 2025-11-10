import 'package:e_commerce_bloc/domain/order/usecases/get_orders_use_case.dart';
import 'package:e_commerce_bloc/presentation/settings/bloc/order_state.dart';
import 'package:e_commerce_bloc/services_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderLoadingState());

  void getOrders() async {
    final data = await sl<GetOrdersUseCase>().call();

    data.fold(
      (error) {
        emit(OrderFailureState());
      },
      (data) {
        emit(OrderLoadedState(orders: data));
      },
    );
  }
}
