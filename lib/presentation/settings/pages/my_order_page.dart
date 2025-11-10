import 'package:e_commerce_bloc/common/widgets/basic_app_bar.dart';
import 'package:e_commerce_bloc/core/configs/theme/app_colors.dart';
import 'package:e_commerce_bloc/presentation/settings/bloc/order_cubit.dart';
import 'package:e_commerce_bloc/presentation/settings/bloc/order_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyOrderPage extends StatelessWidget {
  const MyOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(),
      body: BlocProvider<OrderCubit>(
        create: (BuildContext context) => OrderCubit()..getOrders(),
        child: BlocBuilder<OrderCubit, OrderState>(
          builder: (BuildContext context, state) {
            if (state is OrderLoadingState) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is OrderLoadedState) {
              return ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    height: 70,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: AppColors.secondBackground,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.receipt_rounded),
                            const SizedBox(width: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Order #${state.orders[index].order}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  '${state.orders[index].products.length} item',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Icon(Icons.arrow_forward_ios_rounded),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 15.0),
                itemCount: state.orders.length,
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
