import 'dart:developer';

import 'package:e_commerce_bloc/domain/auth/usecases/get_user_info_use_case.dart';
import 'package:e_commerce_bloc/presentation/home/bloc/user_info_state.dart';
import 'package:e_commerce_bloc/services_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserInfoCubit extends Cubit<UserInfoState> {
  UserInfoCubit() : super(UserInfoLoadingState());

  void getData() async {
    var data = await sl<GetUserInfoUseCase>().call();

    data.fold(
      (left) {
        log('Failed');
        emit(UserInfoFailureState());
      },
      (right) {
        emit(UserInfoLoadedState(userData: right));
      },
    );
  }
}
