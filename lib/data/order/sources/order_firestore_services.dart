import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_bloc/data/categories/error_mappers/firebase_firestore_error_mappers.dart';
import 'package:e_commerce_bloc/data/order/model/order_model.dart';
import 'package:e_commerce_bloc/data/order/model/product_cart_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class OrderFirestoreServices {
  Future<Either<String, String>> addToCart(ProductCartModel product);
  Future<Either<String, List<QueryDocumentSnapshot<Map<String, dynamic>>>>>
  getCartProduct();
  Future<Either<String, String>> removeFromCart(String productId);
  Future<Either<String, String>> addOrder(OrderModel product);
}

class OrderFirestoreServicesImpl extends OrderFirestoreServices {
  final _firestore = FirebaseFirestore.instance
      .collection('Users')
      .doc(FirebaseAuth.instance.currentUser!.uid);
  @override
  Future<Either<String, String>> addToCart(ProductCartModel product) async {
    try {
      await _firestore.collection('Cart').add(product.toMap());
      return Right('Success');
    } catch (e) {
      return Left('Error');
    }
  }

  @override
  Future<Either<String, List<QueryDocumentSnapshot<Map<String, dynamic>>>>>
  getCartProduct() async {
    try {
      final data = await _firestore.collection('Cart').get();
      return Right(data.docs);
    } catch (e) {
      return Left('Error');
    }
  }

  @override
  Future<Either<String, String>> removeFromCart(String productId) async {
    try {
      await _firestore.collection('Cart').doc(productId).delete();
      return Right('Success');
    } on FirebaseException catch (e) {
      final message = FirebaseFirestoreErrorMappers.mapFirestoreError(e.code);
      return Left(message);
    }
  }

  @override
  Future<Either<String, String>> addOrder(OrderModel product) async {
    try {
      final data = await _firestore.collection('Orders').add(product.toMap());
      print(data.id);
      return Right('Success');
    } on FirebaseException catch (e) {
      final message = FirebaseFirestoreErrorMappers.mapFirestoreError(e.code);
      return Left(message);
    }
  }
}
