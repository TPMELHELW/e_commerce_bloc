import 'package:e_commerce_bloc/presentation/home/categories_bloc/categories_cubit.dart';
import 'package:e_commerce_bloc/presentation/home/categories_bloc/categories_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoriesCubit>(
      create: (BuildContext context) => CategoriesCubit()..getCategories(),
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          if (state is CategoriesLoadingState) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is CategoriesLoadedState) {
            return Column(
              spacing: 10.0,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Categories',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'See All',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 100.0,
                  child: ListView.separated(
                    // shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    itemBuilder: (context, index) {
                      return Column(
                        spacing: 8.0,
                        children: [
                          CircleAvatar(radius: 30.0),
                          Text(state.categories[index].title),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(width: 10.0),
                    itemCount: state.categories.length,
                  ),
                ),
              ],
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
