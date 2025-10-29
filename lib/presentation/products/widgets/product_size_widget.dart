import 'package:e_commerce_bloc/common/bloc/products_bloc/products_details_bloc/select_size_cubit.dart';
import 'package:e_commerce_bloc/common/helper/app_bottom_sheet.dart';
import 'package:e_commerce_bloc/core/configs/theme/app_colors.dart';
import 'package:e_commerce_bloc/presentation/products/widgets/selection_size_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class ProductSizeWidget extends StatelessWidget {
  const ProductSizeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppBottomsheet.display(
          context,
          BlocProvider.value(
            value: context.read<SelectSizeCubit>(),
            child: SelectionSizeWidget(),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: AppColors.secondBackground,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 10.0,
          children: [
            Text(
              'Size',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0),
            ),
            Row(
              spacing: 10.0,
              children: [
                BlocBuilder<SelectSizeCubit, String>(
                  builder: (context, state) {
                    return Text(
                      state,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    );
                  },
                ),
                Icon(Iconsax.arrow_bottom, size: 30),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
