import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_bloc/data/auth/models/user_creation_model.dart';

abstract class AuthRepository {
  Future<Either> signUp(UserCreationModel user);
  // Future<Either<String, List<QueryDocumentSnapshot<Map<String, dynamic>>>>>
  // getAges();
}
