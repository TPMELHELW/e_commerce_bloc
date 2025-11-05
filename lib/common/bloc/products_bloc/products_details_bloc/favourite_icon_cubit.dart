import 'package:e_commerce_bloc/domain/product/entity/product_entity.dart';
import 'package:e_commerce_bloc/domain/product/usecase/add_or_remove_favourite_product_use_case.dart';
import 'package:e_commerce_bloc/domain/product/usecase/is_favourite_use_case.dart';
import 'package:e_commerce_bloc/services_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteIconCubit extends Cubit<bool> {
  FavouriteIconCubit() : super(false);

  void isFavourite(String productId) async {
    final bool data = await sl<IsFavouriteUseCase>().call(params: productId);
    emit(data);
  }

  void onTap(ProductEntity product) async {
    final data = await sl<AddOrRemoveFavoriteProductUseCase>().call(
      params: product,
    );

    data.fold(
      (error) {
        emit(false);
      },
      (data) {
        emit(data);
      },
    );
  }
}
