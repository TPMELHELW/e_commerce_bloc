import 'package:e_commerce_bloc/domain/order/entity/product_cart_entity.dart';

abstract class CartProductsState {}

class CartProductsLoadingState extends CartProductsState {}

class CartProductsLoadedState extends CartProductsState {
  final List<ProductCartEntity> cartProducts;

  CartProductsLoadedState({required this.cartProducts});
}

class CartProductsFailureState extends CartProductsState {}

class CartProductsSuccessState extends CartProductsState {}
