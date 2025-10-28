import 'package:e_commerce_bloc/core/configs/theme/app_colors.dart';
import 'package:e_commerce_bloc/presentation/home/bloc/new_products_bloc/new_products_cubit.dart';
import 'package:e_commerce_bloc/presentation/home/bloc/new_products_bloc/new_products_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewProductsWidget extends StatelessWidget {
  const NewProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewProductsCubit>(
      create: (BuildContext context) => NewProductsCubit()..getNewProductData(),
      child: BlocBuilder<NewProductsCubit, NewProductsState>(
        builder: (BuildContext context, state) {
          if (state is NewProductsLoadingState) {
            Center(child: CircularProgressIndicator());
          }

          if (state is NewProductsLoadedState) {
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
                      return Container(
                        width: 180,
                        decoration: BoxDecoration(
                          color: AppColors.secondBackground,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 4,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                      'assets/products/${state.newProducts[index].title}.png',
                                    ),
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.newProducts[index].title,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          state
                                                      .newProducts[index]
                                                      .discountedPrice ==
                                                  0
                                              ? "${state.newProducts[index].price}\$"
                                              : "${state.newProducts[index].discountedPrice}\$",
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          state
                                                      .newProducts[index]
                                                      .discountedPrice ==
                                                  0
                                              ? ''
                                              : "${state.newProducts[index].price}\$",
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w300,
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 10),
                    itemCount: state.newProducts.length,
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
