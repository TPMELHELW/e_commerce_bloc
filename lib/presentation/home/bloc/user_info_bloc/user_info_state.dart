import 'package:e_commerce_bloc/domain/auth/entity/user_entity.dart';

abstract class UserInfoState {}

class UserInfoLoadingState extends UserInfoState {}

class UserInfoLoadedState extends UserInfoState {
  final UserEntity userData;

  UserInfoLoadedState({required this.userData});
}

class UserInfoFailureState extends UserInfoState {}
