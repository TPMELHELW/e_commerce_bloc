import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_bloc/data/categories/error_mappers/firebase_firestore_error_mappers.dart';
import 'package:e_commerce_bloc/data/product/model/product_model.dart';
import 'package:e_commerce_bloc/domain/product/entity/product_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseServices {
  Future<Either> getData(String name, {String? field, dynamic cond});
  Future<Either> getDataIsEqual(String name, {String? field, dynamic cond});
  Future<Either> addOrRemoveFavouriteProduct(ProductEntity product);
  Future<Either> getFavouriteProducts();
  Future<bool> isFavourite(String productId);
}

class FirebaseServicesImpl extends FirebaseServices {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final currentUser = FirebaseAuth.instance.currentUser;

  @override
  Future<Either> getData(String name, {String? field, dynamic cond}) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> data = await _fireStore
          .collection(name)
          .where(field ?? '', isGreaterThanOrEqualTo: cond)
          .get();

      return Right(data.docs);
    } on FirebaseException catch (e) {
      final message = FirebaseFirestoreErrorMappers.mapFirestoreError(e.code);
      return Left(message);
    }
  }

  @override
  Future<Either> getDataIsEqual(String name, {String? field, cond}) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> data = await _fireStore
          .collection(name)
          .where(field ?? '', isEqualTo: cond)
          .get();
      print(data.docs.length);

      return Right(data.docs);
    } on FirebaseException catch (e) {
      final message = FirebaseFirestoreErrorMappers.mapFirestoreError(e.code);
      return Left(message);
    }
  }

  @override
  Future<Either> addOrRemoveFavouriteProduct(ProductEntity product) async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser!.uid;
      final data = await _fireStore
          .collection('Users')
          .doc(currentUser)
          .collection('Favourites')
          .where('productId', isEqualTo: product.productId)
          .get();

      if (data.docs.isNotEmpty) {
        await data.docs.first.reference.delete();
        return Right(false);
      }
      {
        await _fireStore
            .collection('Users')
            .doc(currentUser)
            .collection('Favourites')
            .add(product.fromEntity().toMap());
        return Right(true);
      }
    } on FirebaseException catch (e) {
      final message = FirebaseFirestoreErrorMappers.mapFirestoreError(e.code);
      return Left(message);
    }
  }

  @override
  Future<Either> getFavouriteProducts() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> data = await _fireStore
          .collection('Users')
          .doc(currentUser!.uid)
          .collection('Favourites')
          .get();
      return Right(data.docs);
    } on FirebaseException catch (e) {
      final message = FirebaseFirestoreErrorMappers.mapFirestoreError(e.code);
      return Left(message);
    }
  }

  @override
  Future<bool> isFavourite(String productId) async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser!.uid;
      final data = await _fireStore
          .collection('Users')
          .doc(currentUser)
          .collection('Favourites')
          .where('productId', isEqualTo: productId)
          .get();

      if (data.docs.isNotEmpty) {
        // await data.docs.first.reference.delete();
        return true;
      }
      {
        return false;
      }
    } catch (e) {
      // final message = FirebaseFirestoreErrorMappers.mapFirestoreError(e.code);
      return false;
    }
  }
}
