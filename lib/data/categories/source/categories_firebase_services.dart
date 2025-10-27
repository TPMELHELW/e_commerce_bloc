import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_bloc/data/categories/error_mappers/firebase_firestore_error_mappers.dart';

abstract class CategoriesFirebaseServices {
  Future<Either<dynamic, List<QueryDocumentSnapshot<Map<String, dynamic>>>>>
  getCategories();
}

class CategoriesFirebaseServicesImpl extends CategoriesFirebaseServices {
  final _fireStore = FirebaseFirestore.instance;

  @override
  Future<Either<dynamic, List<QueryDocumentSnapshot<Map<String, dynamic>>>>>
  getCategories() async {
    try {
      final data = await _fireStore.collection('Categories').get();

      return Right(data.docs);
    } on FirebaseException catch (e) {
      final message = FirebaseFirestoreErrorMappers.mapFirestoreError(e.code);

      return Left(message);
    }
  }
}
