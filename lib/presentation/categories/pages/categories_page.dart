import 'package:e_commerce_bloc/common/bloc/categories_bloc/categories_cubit.dart';
import 'package:e_commerce_bloc/common/bloc/categories_bloc/categories_state.dart';
import 'package:e_commerce_bloc/common/helper/app_navigator.dart';
import 'package:e_commerce_bloc/common/widgets/basic_app_bar.dart';
import 'package:e_commerce_bloc/core/configs/theme/app_colors.dart';
import 'package:e_commerce_bloc/presentation/products/pages/category_products_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 10.0,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Shop by Categories',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),

              BlocBuilder<CategoriesCubit, CategoriesState>(
                builder: (BuildContext context, state) {
                  if (state is CategoriesLoadingState) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (state is CategoriesLoadedState) {
                    return ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => AppNavigator.push(
                            context,
                            CategoryProductsPage(
                              categoriesEntity: state.categories[index],
                            ),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              color: AppColors.secondBackground,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Row(
                              spacing: 10.0,
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage(
                                    'assets/categories/${state.categories[index].imageUrl}',
                                  ),
                                ),
                                Text(state.categories[index].title),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 10.0),
                      itemCount: state.categories.length,
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
