import 'package:e_commerce_bloc/core/constants/product_sizes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectSizeCubit extends Cubit<String> {
  SelectSizeCubit() : super(productSizes[0]);

  String selectedSize = productSizes[0];
  void selectSize(int index) {
    selectedSize = productSizes[index];
    emit(selectedSize);
  }
}
