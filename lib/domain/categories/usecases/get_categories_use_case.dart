import 'package:dartz/dartz.dart';
import 'package:e_commerce_bloc/core/usecase/usecase.dart';
import 'package:e_commerce_bloc/domain/categories/entity/categories_entity.dart';
import 'package:e_commerce_bloc/domain/categories/repository/categories_repository.dart';
import 'package:e_commerce_bloc/services_locator.dart';

class GetCategoriesUseCase implements Usecase<Either, dynamic> {
  @override
  Future<Either<dynamic, List<CategoriesEntity>>> call({params}) async {
    return await sl<CategoriesRepository>().getCategories();
  }
}
