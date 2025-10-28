import 'package:dartz/dartz.dart';
import 'package:e_commerce_bloc/core/usecase/usecase.dart';
import 'package:e_commerce_bloc/domain/product/entity/product_entity.dart';
import 'package:e_commerce_bloc/domain/product/repository/product_repository.dart';
import 'package:e_commerce_bloc/services_locator.dart';

class NewProductsUseCase
    implements Usecase<Either<String, List<ProductEntity>>, dynamic> {
  @override
  Future<Either<String, List<ProductEntity>>> call({params}) async {
    return await sl<ProductRepository>().getNewProducts();
  }
}
