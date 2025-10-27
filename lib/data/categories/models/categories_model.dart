import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_bloc/domain/categories/entity/categories_entity.dart';

class CategoriesModel {
  final String title;
  final String imageUrl;
  final String id;

  CategoriesModel({
    required this.title,
    required this.imageUrl,
    required this.id,
  });

  factory CategoriesModel.fromSnapshot(
    QueryDocumentSnapshot<Map<String, dynamic>> data,
  ) {
    final finalData = data.data();
    return CategoriesModel(
      title: finalData['title'],
      imageUrl: finalData['imageUrl'] ?? '',
      id: data.id,
    );
  }
}

extension CategoriesXModel on CategoriesModel {
  CategoriesEntity toEntity() {
    return CategoriesEntity(title: title, imageUrl: imageUrl, id: id);
  }
}
