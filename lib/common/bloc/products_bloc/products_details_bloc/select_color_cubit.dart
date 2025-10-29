import 'package:flutter_bloc/flutter_bloc.dart';

class SelectColorCubit extends Cubit<int> {
  SelectColorCubit() : super(0);

  int selectedColorIndex = 0;
  void onSelectColor(int index) {
    selectedColorIndex = index;
    emit(selectedColorIndex);
  }
}
