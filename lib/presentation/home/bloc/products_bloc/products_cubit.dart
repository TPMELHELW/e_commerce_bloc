// import 'package:flutter/material.dart';
import 'package:e_commerce_bloc/core/usecase/usecase.dart';
import 'package:e_commerce_bloc/presentation/home/bloc/products_bloc/products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final Usecase useCase;
  ProductsCubit({required this.useCase}) : super(ProductsLoadingState());

  void getNewProductData() async {
    final data = await useCase.call();

    data.fold(
      (error) {
        emit(ProductsFailureState());
      },
      (data) {
        emit(ProductsLoadedState(productsData: data));
      },
    );
  }
}
