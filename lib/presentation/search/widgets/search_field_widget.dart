import 'package:e_commerce_bloc/common/bloc/products_bloc/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        print(value);
        if (value.isEmpty) {
          context.read<ProductsCubit>().displayInitialState();
        } else {
          context.read<ProductsCubit>().getNewProductData(params: value);
        }
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(12),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(50),
        ),
        prefixIcon: Icon(Icons.search),
        hintText: 'Search',
      ),
    );
  }
}
