import 'package:flutter_bloc/flutter_bloc.dart';

class ProductQuantityCubit extends Cubit<int> {
  ProductQuantityCubit() : super(1);

  // int get quantity => state;

  void increment() => emit(state + 1);

  void decrement() {
    if (state > 1) {
      emit(state - 1);
    }
  }
}
