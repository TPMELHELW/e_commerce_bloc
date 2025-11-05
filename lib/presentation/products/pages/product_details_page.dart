import 'package:e_commerce_bloc/common/bloc/button_bloc/button_cubit.dart';
import 'package:e_commerce_bloc/common/bloc/products_bloc/products_details_bloc/favourite_icon_cubit.dart';
import 'package:e_commerce_bloc/common/bloc/products_bloc/products_details_bloc/product_quantity_cubit.dart';
import 'package:e_commerce_bloc/common/bloc/products_bloc/products_details_bloc/select_color_cubit.dart';
import 'package:e_commerce_bloc/common/bloc/products_bloc/products_details_bloc/select_size_cubit.dart';
import 'package:e_commerce_bloc/common/widgets/basic_app_bar.dart';
import 'package:e_commerce_bloc/core/configs/theme/app_colors.dart';
// import 'package:e_commerce_bloc/core/constants/product_colors.dart';
// import 'package:e_commerce_bloc/core/constants/product_sizes.dart';
import 'package:e_commerce_bloc/domain/product/entity/product_entity.dart';
import 'package:e_commerce_bloc/presentation/products/widgets/add_to_bag_widget.dart';
import 'package:e_commerce_bloc/presentation/products/widgets/product_color_widget.dart';
import 'package:e_commerce_bloc/presentation/products/widgets/product_images_widget.dart';
import 'package:e_commerce_bloc/presentation/products/widgets/product_quantity_widget.dart';
import 'package:e_commerce_bloc/presentation/products/widgets/product_size_widget.dart';
// import 'package:e_commerce_bloc/presentation/products/widgets/selection_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
// import 'package:iconsax/iconsax.dart';

class ProductDetailsPage extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductDetailsPage({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SelectSizeCubit>(
          create: (BuildContext context) => SelectSizeCubit(),
        ),
        BlocProvider<SelectColorCubit>(
          create: (BuildContext context) => SelectColorCubit(),
        ),
        BlocProvider<ProductQuantityCubit>(
          create: (BuildContext context) => ProductQuantityCubit(),
        ),
        BlocProvider<ButtonCubit>(
          create: (BuildContext context) => ButtonCubit(),
        ),
        BlocProvider<FavouriteIconCubit>(
          create: (BuildContext context) =>
              FavouriteIconCubit()..isFavourite(productEntity.productId),
        ),
      ],
      child: Scaffold(
        bottomNavigationBar: AddToBagWidget(productEntity: productEntity),
        appBar: BasicAppbar(
          action: BlocBuilder<FavouriteIconCubit, bool>(
            builder: (BuildContext context, state) {
              return IconButton(
                onPressed: () {
                  context.read<FavouriteIconCubit>().onTap(productEntity);
                },
                icon: Icon(state ? Iconsax.lovely5 : Iconsax.lovely),
              );
              // return
            },
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10.0,
            children: [
              ProductImagesWidget(productEntity: productEntity),
              Text(
                productEntity.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                "\$${productEntity.discountedPrice != 0 ? productEntity.discountedPrice.toString() : productEntity.price.toString()}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                  fontSize: 14,
                ),
              ),
              ProductSizeWidget(),
              ProductColorWidget(),
              ProductQuantity(productEntity: productEntity),
            ],
          ),
        ),
      ),
    );
  }
}
