import 'package:dartz/dartz.dart';
import 'package:e_commerce_bloc/core/usecase/usecase.dart';
import 'package:e_commerce_bloc/domain/auth/repository/auth_repository.dart';
import 'package:e_commerce_bloc/services_locator.dart';

class ForgetPasswordUseCase implements Usecase<Either, String> {
  @override
  Future<Either> call({String? params}) {
    return sl<AuthRepository>().forgetPassword(params!);
  }
}
