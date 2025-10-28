import 'package:e_commerce_bloc/domain/categories/entity/categories_entity.dart';

abstract class CategoriesState {}

class CategoriesLoadingState extends CategoriesState {}

class CategoriesLoadedState extends CategoriesState {
  final List<CategoriesEntity> categories;

  CategoriesLoadedState({required this.categories});
}

class CategoriesFailureState extends CategoriesState {}
