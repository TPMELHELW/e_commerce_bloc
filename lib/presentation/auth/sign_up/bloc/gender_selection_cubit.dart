import 'package:flutter_bloc/flutter_bloc.dart';

class GenderSelectionCubit extends Cubit<int> {
  GenderSelectionCubit() : super(1);

  int selectedGender = 1;

  void selectGender(int index) {
    selectedGender = index;
    emit(selectedGender);
  }
}
