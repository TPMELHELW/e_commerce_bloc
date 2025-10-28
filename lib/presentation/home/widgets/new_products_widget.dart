import 'package:e_commerce_bloc/common/widgets/product_widget.dart';
import 'package:e_commerce_bloc/domain/product/usecase/new_products_use_case.dart';
import 'package:e_commerce_bloc/common/bloc/products_bloc/products_cubit.dart';
import 'package:e_commerce_bloc/common/bloc/products_bloc/products_state.dart';
import 'package:e_commerce_bloc/services_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewProductsWidget extends StatelessWidget {
  const NewProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductsCubit>(
      create: (BuildContext context) =>
          ProductsCubit(useCase: sl<NewProductsUseCase>())..getNewProductData(),
      child: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (BuildContext context, state) {
          if (state is ProductsLoadingState) {
            Center(child: CircularProgressIndicator());
          }

          if (state is ProductsLoadedState) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'NewIn',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextButton(onPressed: () {}, child: Text('See All')),
                  ],
                ),
                SizedBox(
                  height: 300,
                  child: ListView.separated(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return ProductWidget(
                        productEntity: state.productsData[index],
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 10),
                    itemCount: state.productsData.length,
                  ),
                ),
              ],
            );
          }
          return Container();
        },
        // child:
      ),
    );
  }
}
