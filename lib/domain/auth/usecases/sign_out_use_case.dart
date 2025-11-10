import 'package:dartz/dartz.dart';
import 'package:e_commerce_bloc/core/usecase/usecase.dart';
import 'package:e_commerce_bloc/domain/auth/repository/auth_repository.dart';
import 'package:e_commerce_bloc/services_locator.dart';

class SignOutUseCase implements Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<AuthRepository>().signOut();
  }
}
