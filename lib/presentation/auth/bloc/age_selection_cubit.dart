import 'package:flutter_bloc/flutter_bloc.dart';

class AgeSelectionCubit extends Cubit<String> {
  AgeSelectionCubit() : super('Age Range');

  void selectAge(String age) {
    emit(age);
  }
}
