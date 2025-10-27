import 'package:e_commerce_bloc/data/auth/repository/auth_repository_impl.dart';
import 'package:e_commerce_bloc/data/auth/sources/auth_firebase_services.dart';
import 'package:e_commerce_bloc/data/categories/repository/categories_repository_impl.dart';
import 'package:e_commerce_bloc/data/categories/source/categories_firebase_services.dart';
import 'package:e_commerce_bloc/domain/auth/repository/auth_repository.dart';
import 'package:e_commerce_bloc/domain/auth/usecases/forget_password_use_case.dart';
import 'package:e_commerce_bloc/domain/auth/usecases/get_user_info_use_case.dart';
import 'package:e_commerce_bloc/domain/auth/usecases/is_sign_in_use_case.dart';
import 'package:e_commerce_bloc/domain/auth/usecases/sign_in_use_case.dart';
import 'package:e_commerce_bloc/domain/auth/usecases/signup_use_case.dart';
import 'package:e_commerce_bloc/domain/categories/repository/categories_repository.dart';
import 'package:e_commerce_bloc/domain/categories/usecases/get_categories_use_case.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initServicesLocator() async {
  sl.registerSingleton<AuthFirebaseServices>(AuthFirebaseServicesImpl());
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SignInUseCase>(SignInUseCase());
  sl.registerSingleton<ForgetPasswordUseCase>(ForgetPasswordUseCase());
  sl.registerSingleton<IsSignInUseCase>(IsSignInUseCase());
  sl.registerSingleton<GetUserInfoUseCase>(GetUserInfoUseCase());
  sl.registerSingleton<CategoriesFirebaseServices>(
    CategoriesFirebaseServicesImpl(),
  );

  sl.registerSingleton<CategoriesRepository>(CategoriesRepositoryImpl());
  sl.registerSingleton<GetCategoriesUseCase>(GetCategoriesUseCase());
}
