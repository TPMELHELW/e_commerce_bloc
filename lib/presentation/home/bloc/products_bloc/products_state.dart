import 'package:e_commerce_bloc/domain/product/entity/product_entity.dart';

abstract class ProductsState {}

class ProductsLoadingState extends ProductsState {}

class ProductsLoadedState extends ProductsState {
  final List<ProductEntity> productsData;

  ProductsLoadedState({required this.productsData});
}

class ProductsFailureState extends ProductsState {}
