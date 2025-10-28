import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_bloc/data/categories/error_mappers/firebase_firestore_error_mappers.dart';

abstract class FirebaseServices {
  Future<Either> getData(String name, {String? field, dynamic? cond});
  Future<Either> getDataIsEqual(String name, {String? field, dynamic? cond});
}

class FirebaseServicesImpl extends FirebaseServices {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  @override
  Future<Either> getData(String name, {String? field, dynamic? cond}) async {
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

      return Right(data.docs);
    } on FirebaseException catch (e) {
      final message = FirebaseFirestoreErrorMappers.mapFirestoreError(e.code);
      return Left(message);
    }
  }
}
