import 'package:dartz/dartz.dart';
import 'package:e_commerce_bloc/data/auth/models/user_creation_model.dart';
import 'package:e_commerce_bloc/data/auth/sources/auth_firebase_services.dart';
import 'package:e_commerce_bloc/domain/auth/repository/auth_repository.dart';
import 'package:e_commerce_bloc/services_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signUp(UserCreationModel user) async {
    return await sl<AuthFirebaseServices>().signUp(user);
  }
}
