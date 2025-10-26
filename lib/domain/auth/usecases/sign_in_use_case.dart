import 'package:dartz/dartz.dart';
import 'package:e_commerce_bloc/core/usecase/usecase.dart';
import 'package:e_commerce_bloc/data/auth/models/user_creation_model.dart';
import 'package:e_commerce_bloc/domain/auth/repository/auth_repository.dart';
import 'package:e_commerce_bloc/services_locator.dart';

class SignInUseCase implements Usecase<Either, UserCreationModel> {
  @override
  Future<Either> call({UserCreationModel? params}) async {
    return await sl<AuthRepository>().signIn(params!);
  }
}
