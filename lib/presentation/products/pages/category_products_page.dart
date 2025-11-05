import 'package:e_commerce_bloc/common/bloc/products_bloc/products_cubit.dart';
import 'package:e_commerce_bloc/common/bloc/products_bloc/products_state.dart';
import 'package:e_commerce_bloc/common/widgets/basic_app_bar.dart';
import 'package:e_commerce_bloc/common/widgets/product_grid_widget.dart';
import 'package:e_commerce_bloc/domain/categories/entity/categories_entity.dart';
import 'package:e_commerce_bloc/domain/product/usecase/get_category_product_use_case.dart';
import 'package:e_commerce_bloc/services_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryProductsPage extends StatelessWidget {
  final CategoriesEntity categoriesEntity;
  const CategoryProductsPage({super.key, required this.categoriesEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(),
      body: BlocProvider<ProductsCubit>(
        create: (BuildContext context) =>
            ProductsCubit(useCase: sl<GetCategoryProductUseCase>())
              ..getNewProductData(params: categoriesEntity.id),
        child: BlocBuilder<ProductsCubit, ProductsState>(
          builder: (BuildContext context, ProductsState state) {
            if (state is ProductsLoadingState) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is ProductsLoadedState) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  spacing: 10.0,
                  children: [
                    Text(
                      categoriesEntity.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    ProductGridWidget(products: state.productsData),
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
