import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_bloc/data/order/model/product_cart_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class OrderFirestoreServices {
  Future<Either> addToCart(ProductCartModel product);
  Future<Either<String, List<QueryDocumentSnapshot<Map<String, dynamic>>>>>
  getCartProduct();
  Future<Either> removeFromCart(String productId);
}

class OrderFirestoreServicesImpl extends OrderFirestoreServices {
  final currentUser = FirebaseAuth.instance.currentUser;
  @override
  Future<Either> addToCart(ProductCartModel product) async {
    try {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(currentUser!.uid)
          .collection('Cart')
          .add(product.toMap());
      return Right('Success');
    } catch (e) {
      return Left('Error');
    }
  }

  @override
  Future<Either<String, List<QueryDocumentSnapshot<Map<String, dynamic>>>>>
  getCartProduct() async {
    try {
      final data = await FirebaseFirestore.instance
          .collection('Users')
          .doc(currentUser!.uid)
          .collection('Cart')
          .get();
      return Right(data.docs);
    } catch (e) {
      return Left('Error');
    }
  }

  @override
  Future<Either> removeFromCart(String productId) async {
    try {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(currentUser!.uid)
          .collection('Cart')
          .doc(productId)
          .delete();
      return Right('Success');
    } catch (e) {
      return Left('error');
    }
  }
}
