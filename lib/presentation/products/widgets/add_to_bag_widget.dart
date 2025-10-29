import 'package:e_commerce_bloc/common/bloc/button_bloc/button_cubit.dart';
import 'package:e_commerce_bloc/common/bloc/products_bloc/products_details_bloc/product_quantity_cubit.dart';
import 'package:e_commerce_bloc/common/helper/product_price_helper.dart';
import 'package:e_commerce_bloc/common/widgets/reactive_button_widget.dart';
import 'package:e_commerce_bloc/data/order/model/product_cart_model.dart';
import 'package:e_commerce_bloc/domain/order/usecases/add_to_cart_use_case.dart';
import 'package:e_commerce_bloc/domain/product/entity/product_entity.dart';
import 'package:e_commerce_bloc/services_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddToBagWidget extends StatelessWidget {
  final ProductEntity productEntity;
  const AddToBagWidget({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ReactiveButtonWidget(
        onPressed: () {
          context.read<ButtonCubit>().execute(
            usecase: sl<AddToCartUseCase>(),
            params: ProductCartModel(
              productId: productEntity.productId,
              productTitle: productEntity.title,
              productQuantity: context.read<ProductQuantityCubit>().state,
              productPrice: productEntity.discountedPrice.toDouble(),
              totalPrice:
                  ProductPriceHelper.provideCurrentPrice(productEntity) *
                  context.read<ProductQuantityCubit>().state,
              productImage: productEntity.images[0],
            ),
          );
        },
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocBuilder<ProductQuantityCubit, int>(
              builder: (context, state) {
                return Text(
                  "\$${state * ProductPriceHelper.provideCurrentPrice(productEntity)}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 14,
                  ),
                );
              },
            ),
            Text(
              'Add to Bag',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
