import 'package:e_commerce_bloc/presentation/home/widgets/categories_widget.dart';
import 'package:e_commerce_bloc/presentation/home/widgets/header_widget.dart';
import 'package:e_commerce_bloc/presentation/home/widgets/new_products_widget.dart';
import 'package:e_commerce_bloc/presentation/home/widgets/search_widget.dart';
import 'package:e_commerce_bloc/presentation/home/widgets/top_selling_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              spacing: 20.0,
              children: [
                HeaderWidget(),
                SearchWidget(),
                CategoriesWidget(),
                TopSellingWidget(),
                NewProductsWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
