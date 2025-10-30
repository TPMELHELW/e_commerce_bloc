import 'package:e_commerce_bloc/domain/order/usecases/get_cart_products_use_case.dart';
import 'package:e_commerce_bloc/domain/order/usecases/remove_product_use_case.dart';
import 'package:e_commerce_bloc/presentation/cart/bloc/cart_products_state.dart';
import 'package:e_commerce_bloc/services_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartProductsCubit extends Cubit<CartProductsState> {
  CartProductsCubit() : super(CartProductsLoadingState());

  void getCartProducts() async {
    final data = await sl<GetCartProductsUseCase>().call();

    data.fold(
      (error) {
        emit(CartProductsFailureState());
      },
      (data) {
        emit(CartProductsLoadedState(cartProducts: data));
      },
    );
  }

  void removeProduct(String id) async {
    emit(CartProductsLoadingState());

    final data = await sl<RemoveProductUseCase>().call(params: id);
    data.fold(
      (error) {
        emit(CartProductsFailureState());
      },
      (data) {
        getCartProducts();
      },
    );
  }
}
