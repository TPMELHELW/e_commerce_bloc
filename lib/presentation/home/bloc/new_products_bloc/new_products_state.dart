import 'package:e_commerce_bloc/domain/product/entity/product_entity.dart';

abstract class NewProductsState {}

class NewProductsLoadingState extends NewProductsState {}

class NewProductsLoadedState extends NewProductsState {
  final List<ProductEntity> newProducts;

  NewProductsLoadedState({required this.newProducts});
}

class NewProductsFailureState extends NewProductsState {}
