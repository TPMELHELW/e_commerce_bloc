import 'package:e_commerce_bloc/common/bloc/products_bloc/products_details_bloc/select_color_cubit.dart';
// import 'package:e_commerce_bloc/common/bloc/products_bloc/products_details_bloc/select_size_cubit.dart';
import 'package:e_commerce_bloc/core/configs/theme/app_colors.dart';
import 'package:e_commerce_bloc/core/constants/product_colors.dart';
// import 'package:e_commerce_bloc/core/constants/product_sizes.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class SelectionColorWidget extends StatelessWidget {
  const SelectionColorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Sizes',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),

              // IconButton(onPressed: onPressed, icon: icon)
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Iconsax.close_circle),
              ),
            ],
          ),

          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    context.read<SelectColorCubit>().onSelectColor(index);
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 60.0,
                    padding: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color:
                          context.read<SelectColorCubit>().selectedColorIndex ==
                              index
                          ? AppColors.primary
                          : AppColors.secondBackground,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      spacing: 10.0,
                      children: [
                        Text(
                          productColors.keys.elementAt(index),
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                          ),
                        ),

                        // Spacer(),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 10.0),
              itemCount: productColors.length,
            ),
          ),
        ],
      ),
    );
  }
}
