import 'package:dartz/dartz.dart';
import 'package:e_commerce_bloc/domain/categories/entity/categories_entity.dart';

abstract class CategoriesRepository {
  Future<Either<dynamic, List<CategoriesEntity>>> getCategories();
}
