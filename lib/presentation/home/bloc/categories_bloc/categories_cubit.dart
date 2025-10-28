import 'package:e_commerce_bloc/domain/categories/usecases/get_categories_use_case.dart';
import 'package:e_commerce_bloc/presentation/home/bloc/categories_bloc/categories_state.dart';
import 'package:e_commerce_bloc/services_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesLoadingState());

  void getCategories() async {
    final data = await sl<GetCategoriesUseCase>().call();

    data.fold(
      (error) {
        emit(CategoriesFailureState());
      },
      (data) {
        emit(CategoriesLoadedState(categories: data));
      },
    );
  }
}
