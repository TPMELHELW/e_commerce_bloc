import 'package:e_commerce_bloc/common/bloc/button_bloc/button_cubit.dart';
import 'package:e_commerce_bloc/common/bloc/button_bloc/button_state.dart';
import 'package:e_commerce_bloc/common/helper/app_navigator.dart';
import 'package:e_commerce_bloc/common/helper/cart_helper.dart';
import 'package:e_commerce_bloc/common/widgets/reactive_button_widget.dart';
import 'package:e_commerce_bloc/core/configs/theme/app_colors.dart';
import 'package:e_commerce_bloc/data/order/model/order_model.dart';
import 'package:e_commerce_bloc/domain/order/entity/product_cart_entity.dart';
import 'package:e_commerce_bloc/domain/order/usecases/add_order_use_case.dart';
import 'package:e_commerce_bloc/presentation/cart/pages/success_page.dart';
import 'package:e_commerce_bloc/services_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutDetailsWidget extends StatelessWidget {
  final List<ProductCartEntity> products;
  const CheckoutDetailsWidget({required this.products, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: MediaQuery.of(context).size.height / 3.5,
      color: AppColors.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Subtotal',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              Text(
                '\$${CartHelper.calculateCartSubtotal(products).toString()}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Shipping Cost',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              Text(
                '\$8',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Tax', style: TextStyle(color: Colors.grey, fontSize: 16)),
              Text(
                '\$0.0',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              Text(
                '\$${CartHelper.calculateCartSubtotal(products) + 8}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          BlocListener<ButtonCubit, ButtonState>(
            listener: (BuildContext context, ButtonState state) {
              if (state is ButtonStateSuccess) {
                AppNavigator.push(context, SuccessPage());
              }
            },
            child: ReactiveButtonWidget(
              onPressed: () {
                context.read<ButtonCubit>().execute(
                  usecase: sl<AddOrderUseCase>(),
                  params: OrderModel(
                    products: products,
                    createdDate: DateTime.now().toString(),
                    itemCount: products.length,
                    totalPrice: CartHelper.calculateCartSubtotal(products),
                    shippingAddress: 'Address',
                  ),
                );
              },
              title: 'Checkout',
            ),
          ),
        ],
      ),
    );
  }
}
