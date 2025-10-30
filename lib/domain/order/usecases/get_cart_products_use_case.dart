import 'package:dartz/dartz.dart';
import 'package:e_commerce_bloc/core/usecase/usecase.dart';
import 'package:e_commerce_bloc/domain/order/entity/product_cart_entity.dart';
import 'package:e_commerce_bloc/domain/order/repository/order_repository.dart';
import 'package:e_commerce_bloc/services_locator.dart';

class GetCartProductsUseCase
    implements Usecase<Either<String, List<ProductCartEntity>>, dynamic> {
  @override
  Future<Either<String, List<ProductCartEntity>>> call({params}) async {
    return await sl<OrderRepository>().getCartProducts();
  }
}
