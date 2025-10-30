import 'package:e_commerce_bloc/common/services/firebase_services.dart';
import 'package:e_commerce_bloc/data/auth/repository/auth_repository_impl.dart';
import 'package:e_commerce_bloc/data/auth/sources/auth_firebase_services.dart';
import 'package:e_commerce_bloc/data/categories/repository/categories_repository_impl.dart';
import 'package:e_commerce_bloc/data/order/repository/order_repository_impl.dart';
import 'package:e_commerce_bloc/data/order/sources/order_firestore_services.dart';
import 'package:e_commerce_bloc/data/product/repository/product_repository_impl.dart';
import 'package:e_commerce_bloc/domain/auth/repository/auth_repository.dart';
import 'package:e_commerce_bloc/domain/auth/usecases/forget_password_use_case.dart';
import 'package:e_commerce_bloc/domain/auth/usecases/get_user_info_use_case.dart';
import 'package:e_commerce_bloc/domain/auth/usecases/is_sign_in_use_case.dart';
import 'package:e_commerce_bloc/domain/auth/usecases/sign_in_use_case.dart';
import 'package:e_commerce_bloc/domain/auth/usecases/signup_use_case.dart';
import 'package:e_commerce_bloc/domain/categories/repository/categories_repository.dart';
import 'package:e_commerce_bloc/domain/categories/usecases/get_categories_use_case.dart';
import 'package:e_commerce_bloc/domain/order/repository/order_repository.dart';
import 'package:e_commerce_bloc/domain/order/usecases/add_to_cart_use_case.dart';
import 'package:e_commerce_bloc/domain/order/usecases/get_cart_products_use_case.dart';
import 'package:e_commerce_bloc/domain/product/repository/product_repository.dart';
import 'package:e_commerce_bloc/domain/product/usecase/get_category_product_use_case.dart';
import 'package:e_commerce_bloc/domain/product/usecase/get_top_seller_use_case.dart';
import 'package:e_commerce_bloc/domain/product/usecase/new_products_use_case.dart';
import 'package:e_commerce_bloc/domain/product/usecase/product_search_use_case.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initServicesLocator() async {
  sl.registerSingleton<AuthFirebaseServices>(AuthFirebaseServicesImpl());
  sl.registerSingleton<OrderFirestoreServices>(OrderFirestoreServicesImpl());
  sl.registerSingleton<FirebaseServices>(FirebaseServicesImpl());
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<OrderRepository>(OrderRepositoryImpl());
  sl.registerSingleton<CategoriesRepository>(CategoriesRepositoryImpl());
  sl.registerSingleton<ProductRepository>(ProductRepositoryImpl());
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SignInUseCase>(SignInUseCase());
  sl.registerSingleton<ForgetPasswordUseCase>(ForgetPasswordUseCase());
  sl.registerSingleton<IsSignInUseCase>(IsSignInUseCase());
  sl.registerSingleton<GetUserInfoUseCase>(GetUserInfoUseCase());
  sl.registerSingleton<GetCategoriesUseCase>(GetCategoriesUseCase());
  sl.registerSingleton<GetTopSellerUseCase>(GetTopSellerUseCase());
  sl.registerSingleton<NewProductsUseCase>(NewProductsUseCase());
  sl.registerSingleton<GetCategoryProductUseCase>(GetCategoryProductUseCase());
  sl.registerSingleton<ProductSearchUseCase>(ProductSearchUseCase());
  sl.registerSingleton<AddToCartUseCase>(AddToCartUseCase());
  sl.registerSingleton<GetCartProductsUseCase>(GetCartProductsUseCase());
}
