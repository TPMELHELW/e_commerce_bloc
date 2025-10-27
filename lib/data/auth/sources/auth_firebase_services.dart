import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_bloc/data/auth/mappers/auth_mappers.dart';
import 'package:e_commerce_bloc/data/auth/models/user_creation_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthFirebaseServices {
  Future<Either> signUp(UserCreationModel user);
  Future<Either> signIn(UserCreationModel user);
  Future<Either> forgetPassword(String email);
  Future<bool> isSignIn();
  Future<Either> getUserInfo();
}

class AuthFirebaseServicesImpl implements AuthFirebaseServices {
  final _auth = FirebaseAuth.instance;

  @override
  Future<Either> signUp(UserCreationModel user) async {
    try {
      final data = await _auth.createUserWithEmailAndPassword(
        email: user.email!.trim(),
        password: user.password!.trim(),
      );
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(data.user?.uid)
          .set(user.toMap());

      return Right('Successfully Signed Up');
    } on FirebaseAuthException catch (e) {
      final message = AuthMappers.signUpMappers(e.code);
      return Left(message);
    }
  }

  @override
  Future<Either> signIn(UserCreationModel user) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: user.email!.trim(),
        password: user.password!.trim(),
      );
      return Right(unit);
    } on FirebaseAuthException catch (e) {
      final message = AuthMappers.signUpMappers(e.code);
      return Left(message);
    }
  }

  @override
  Future<Either> forgetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return Right(unit);
    } on FirebaseAuthException catch (e) {
      final message = AuthMappers.signInMappers(e.code);
      return Left(message);
    }
  }

  @override
  Future<bool> isSignIn() async {
    if (_auth.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<Either> getUserInfo() async {
    try {
      log('sss');
      final data = await FirebaseFirestore.instance
          .collection('Users')
          .doc(_auth.currentUser?.uid)
          .get()
          .then((value) => value.data());
      return Right(data);
    } catch (e) {
      print(e);
      return Left('Failed to get user info');
    }
  }
}
