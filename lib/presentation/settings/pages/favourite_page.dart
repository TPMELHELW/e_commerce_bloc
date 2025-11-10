import 'package:e_commerce_bloc/common/bloc/products_bloc/products_cubit.dart';
import 'package:e_commerce_bloc/common/bloc/products_bloc/products_state.dart';
import 'package:e_commerce_bloc/common/widgets/basic_app_bar.dart';
import 'package:e_commerce_bloc/common/widgets/product_grid_widget.dart';
import 'package:e_commerce_bloc/domain/product/usecase/get_favourite_product_use_case.dart';
import 'package:e_commerce_bloc/services_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(title: Text('My Favourites')),
      body: BlocProvider<ProductsCubit>(
        create: (BuildContext context) =>
            ProductsCubit(useCase: sl<GetFavouriteProductUseCase>())
              ..getNewProductData(),
        child: BlocBuilder<ProductsCubit, ProductsState>(
          builder: (BuildContext context, ProductsState state) {
            if (state is ProductsLoadingState) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is ProductsLoadedState) {
              return Column(
                children: [ProductGridWidget(products: state.productsData)],
              );
            }
            return Container();
          },
          // child:
        ),
      ),
    );
  }
}
