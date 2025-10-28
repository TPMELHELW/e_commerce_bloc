import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_bloc/common/services/firebase_services.dart';
import 'package:e_commerce_bloc/data/categories/models/categories_model.dart';
import 'package:e_commerce_bloc/domain/categories/entity/categories_entity.dart';
import 'package:e_commerce_bloc/domain/categories/repository/categories_repository.dart';
import 'package:e_commerce_bloc/services_locator.dart';

class CategoriesRepositoryImpl extends CategoriesRepository {
  @override
  Future<Either<dynamic, List<CategoriesEntity>>> getCategories() async {
    final data = await sl<FirebaseServices>().getData('Categories');
    return data.fold(
      (left) {
        return Left(left);
      },
      (data) {
        final List<QueryDocumentSnapshot<Map<String, dynamic>>> finalData =
            data;
        return Right(
          finalData
              .map((e) => CategoriesModel.fromSnapshot(e).toEntity())
              .toList(),
        );
      },
    );
  }
}
