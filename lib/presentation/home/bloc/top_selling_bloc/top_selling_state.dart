import 'package:e_commerce_bloc/domain/product/entity/product_entity.dart';

abstract class TopSellingState {}

class TopSellingLoadingState extends TopSellingState {}

class TopSellingLoadedState extends TopSellingState {
  final List<ProductEntity> topSellingProducts;

  TopSellingLoadedState({required this.topSellingProducts});
}

class TopSellingFailureState extends TopSellingState {}
