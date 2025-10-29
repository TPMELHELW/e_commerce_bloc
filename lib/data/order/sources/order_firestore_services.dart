import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_bloc/data/order/model/product_cart_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class OrderFirestoreServices {
  Future<Either> addToCart(ProductCartModel product);
}

class OrderFirestoreServicesImpl extends OrderFirestoreServices {
  @override
  Future<Either> addToCart(ProductCartModel product) async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;

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
}
