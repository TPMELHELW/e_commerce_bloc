import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_bloc/common/services/firebase_services.dart';
import 'package:e_commerce_bloc/data/product/model/product_model.dart';
import 'package:e_commerce_bloc/domain/product/entity/product_entity.dart';
import 'package:e_commerce_bloc/domain/product/repository/product_repository.dart';
import 'package:e_commerce_bloc/services_locator.dart';

class ProductRepositoryImpl extends ProductRepository {
  // final _firebaseServices = sl<

  @override
  Future<Either<String, List<ProductEntity>>> getTopSeller() async {
    final data = await sl<FirebaseServices>().getData(
      'Products',
      field: 'salesNumber',
      cond: 20,
    );

    return data.fold(
      (message) {
        return Left(message);
      },
      (data) {
        final List<QueryDocumentSnapshot<Map<String, dynamic>>> finalData =
            data;
        return Right(
          finalData
              .map((e) => ProductModel.fromSnapshot(e).toEntity())
              .toList(),
        );
      },
    );
  }

  @override
  Future<Either<String, List<ProductEntity>>> getNewProducts() async {
    // try {
    final data = await sl<FirebaseServices>().getData(
      'Products',
      field: 'createdDate',
      cond: Timestamp.now().toDate().subtract(Duration(days: 10)),
    );

    return data.fold(
      (error) {
        return Left(error);
      },
      (data) {
        final List<QueryDocumentSnapshot<Map<String, dynamic>>> finalData =
            data;
        return Right(
          finalData
              .map((e) => ProductModel.fromSnapshot(e).toEntity())
              .toList(),
        );
      },
    );
    // } catch (e) {

    // }
  }

  @override
  Future<Either<String, List<ProductEntity>>> getCategoriesProducts(
    String categoryId,
  ) async {
    final data = await sl<FirebaseServices>().getDataIsEqual(
      'Products',
      cond: categoryId,
      field: 'categoryId',
    );

    return data.fold(
      (error) {
        return Left(error);
      },
      (data) {
        final List<QueryDocumentSnapshot<Map<String, dynamic>>> finalData =
            data;
        return Right(
          finalData
              .map((e) => ProductModel.fromSnapshot(e).toEntity())
              .toList(),
        );
      },
    );
  }

  @override
  Future<Either<String, List<ProductEntity>>> searchProducts(
    String query,
  ) async {
    final data = await sl<FirebaseServices>().getData(
      'Products',
      field: 'title',
      cond: query,
    );

    return data.fold(
      (error) {
        return Left(error);
      },
      (data) {
        final List<QueryDocumentSnapshot<Map<String, dynamic>>> finalData =
            data;
        // print(finalData.length);
        return Right(
          finalData
              .map((e) => ProductModel.fromSnapshot(e).toEntity())
              .toList(),
        );
      },
    );
  }
}
