import 'package:e_commerce_bloc/domain/auth/usecases/is_sign_in_use_case.dart';
import 'package:e_commerce_bloc/presentation/splash/bloc/splash_state.dart';
import 'package:e_commerce_bloc/services_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  void appStarted() async {
    await Future.delayed(Duration(seconds: 2));
    bool isSignIn = await sl<IsSignInUseCase>().call();

    if (isSignIn) {
      emit(Authenticated());
    } else {
      emit(UnAuthenticated());
    }
  }
}
