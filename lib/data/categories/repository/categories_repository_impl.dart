import 'package:dartz/dartz.dart';
import 'package:e_commerce_bloc/data/categories/models/categories_model.dart';
import 'package:e_commerce_bloc/data/categories/source/categories_firebase_services.dart';
import 'package:e_commerce_bloc/domain/categories/entity/categories_entity.dart';
import 'package:e_commerce_bloc/domain/categories/repository/categories_repository.dart';
import 'package:e_commerce_bloc/services_locator.dart';

class CategoriesRepositoryImpl extends CategoriesRepository {
  @override
  Future<Either<dynamic, List<CategoriesEntity>>> getCategories() async {
    final data = await sl<CategoriesFirebaseServices>().getCategories();
    return data.fold(
      (left) {
        return Left(left);
      },
      (data) {
        return Right(
          data.map((e) => CategoriesModel.fromSnapshot(e).toEntity()).toList(),
        );
      },
    );
  }
}
