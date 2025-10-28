// import 'package:flutter/material.dart';
import 'package:e_commerce_bloc/core/usecase/usecase.dart';
import 'package:e_commerce_bloc/common/bloc/products_bloc/products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final Usecase useCase;
  ProductsCubit({required this.useCase}) : super(ProductsInitialState());

  void getNewProductData({params}) async {
    emit(ProductsLoadingState());

    final data = await useCase.call(params: params);

    data.fold(
      (error) {
        emit(ProductsFailureState());
      },
      (data) {
        emit(ProductsLoadedState(productsData: data));
      },
    );
  }

  void displayInitialState() {
    emit(ProductsInitialState());
  }
}
