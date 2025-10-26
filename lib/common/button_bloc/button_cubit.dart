import 'package:e_commerce_bloc/common/button_bloc/button_state.dart';
import 'package:e_commerce_bloc/core/usecase/usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonCubit extends Cubit<ButtonState> {
  ButtonCubit() : super(ButtonStateInitial());

  Future<void> execute({dynamic params, required Usecase usecase}) async {
    try {
      emit(ButtonStateLoading());
      final result = await usecase.call(params: params);
      result.fold(
        (failure) => emit(ButtonStateFailure(message: failure.toString())),
        (data) => emit(ButtonStateSuccess()),
      );
    } catch (e) {
      emit(ButtonStateFailure(message: e.toString()));
    }
  }
}
