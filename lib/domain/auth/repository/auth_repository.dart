// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_bloc/data/auth/models/user_creation_model.dart';
// import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<Either> signUp(UserCreationModel user);
  Future<Either> signIn(UserCreationModel user);
  Future<Either> forgetPassword(String email);
  // Future<Either<String, List<QueryDocumentSnapshot<Map<String, dynamic>>>>>
  // getAges();
}
