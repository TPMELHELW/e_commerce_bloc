import 'package:e_commerce_bloc/common/bloc/products_bloc/products_cubit.dart';
import 'package:e_commerce_bloc/common/bloc/products_bloc/products_state.dart';
import 'package:e_commerce_bloc/common/widgets/basic_app_bar.dart';
import 'package:e_commerce_bloc/domain/product/usecase/product_search_use_case.dart';
import 'package:e_commerce_bloc/presentation/search/widgets/search_field_widget.dart';
import 'package:e_commerce_bloc/presentation/search/widgets/search_result_widget.dart';
import 'package:e_commerce_bloc/services_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter/widgets.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductsCubit>(
      create: (BuildContext context) =>
          ProductsCubit(useCase: sl<ProductSearchUseCase>()),
      child: Scaffold(
        appBar: BasicAppbar(title: SearchFieldWidget()),
        body: BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            if (state is ProductsLoadingState) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is ProductsLoadedState) {
              return state.productsData.isEmpty
                  ? Center(child: Text('No Result'))
                  : SearchResultWidget(products: state.productsData);
            }
            return Container();
          },
        ),
      ),
    );
  }
}
