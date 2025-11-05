import 'package:e_commerce_bloc/common/bloc/button_bloc/button_cubit.dart';
import 'package:e_commerce_bloc/common/widgets/basic_app_bar.dart';
import 'package:e_commerce_bloc/presentation/cart/bloc/cart_products_cubit.dart';
import 'package:e_commerce_bloc/presentation/cart/bloc/cart_products_state.dart';
import 'package:e_commerce_bloc/presentation/cart/widgets/checkout_details_widget.dart';
import 'package:e_commerce_bloc/presentation/cart/widgets/product_cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(title: Text('Cart')),
      body: MultiBlocProvider(
        // create:
        providers: [
          BlocProvider(
            create: (BuildContext context) =>
                CartProductsCubit()..getCartProducts(),
          ),
          BlocProvider(create: (BuildContext context) => ButtonCubit()),
        ],
        child: BlocBuilder<CartProductsCubit, CartProductsState>(
          builder: (BuildContext context, state) {
            if (state is CartProductsLoadingState) {
              return Center(child: CircularProgressIndicator());
            }

            if (state is CartProductsLoadedState) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return ProductCartWidget(
                          productOrderedEntity: state.cartProducts[index],
                        );
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 10.0),
                      itemCount: state.cartProducts.length,
                    ),
                  ),
                  CheckoutDetailsWidget(products: state.cartProducts),
                ],
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
