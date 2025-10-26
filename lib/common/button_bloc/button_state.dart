abstract class ButtonState {}

class ButtonStateInitial extends ButtonState {}

class ButtonStateLoading extends ButtonState {}

class ButtonStateSuccess extends ButtonState {}

class ButtonStateFailure extends ButtonState {
  final String message;

  ButtonStateFailure({required this.message});
}
