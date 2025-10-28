import 'package:dartz/dartz.dart';
import 'package:e_commerce_bloc/domain/product/entity/product_entity.dart';

abstract class ProductRepository {
  Future<Either<String, List<ProductEntity>>> getTopSeller();
  Future<Either<String, List<ProductEntity>>> getNewProducts();
}
