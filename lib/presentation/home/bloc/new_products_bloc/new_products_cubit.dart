// import 'package:flutter/material.dart';
import 'package:e_commerce_bloc/domain/product/usecase/new_products_use_case.dart';
import 'package:e_commerce_bloc/presentation/home/bloc/new_products_bloc/new_products_state.dart';
import 'package:e_commerce_bloc/services_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewProductsCubit extends Cubit<NewProductsState> {
  NewProductsCubit() : super(NewProductsLoadingState());

  void getNewProductData() async {
    final data = await sl<NewProductsUseCase>().call();

    data.fold(
      (error) {
        emit(NewProductsFailureState());
      },
      (data) {
        emit(NewProductsLoadedState(newProducts: data));
      },
    );
  }
}
