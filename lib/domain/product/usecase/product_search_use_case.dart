import 'package:dartz/dartz.dart';
import 'package:e_commerce_bloc/core/usecase/usecase.dart';
import 'package:e_commerce_bloc/domain/product/entity/product_entity.dart';
import 'package:e_commerce_bloc/domain/product/repository/product_repository.dart';
import 'package:e_commerce_bloc/services_locator.dart';

class ProductSearchUseCase
    extends Usecase<Either<String, List<ProductEntity>>, String> {
  @override
  Future<Either<String, List<ProductEntity>>> call({String? params}) async {
    return await sl<ProductRepository>().searchProducts(params!);
  }
}
