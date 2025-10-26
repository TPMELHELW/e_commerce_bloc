import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_bloc/data/auth/mappers/auth_mappers.dart';
import 'package:e_commerce_bloc/data/auth/models/user_creation_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthFirebaseServices {
  Future<Either> signUp(UserCreationModel user);
}

class AuthFirebaseServicesImpl implements AuthFirebaseServices {
  @override
  Future<Either> signUp(UserCreationModel user) async {
    try {
      final data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
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
}
