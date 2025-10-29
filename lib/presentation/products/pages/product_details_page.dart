import 'package:e_commerce_bloc/common/bloc/products_bloc/products_details_bloc/product_quantity_cubit.dart';
import 'package:e_commerce_bloc/common/bloc/products_bloc/products_details_bloc/select_color_cubit.dart';
import 'package:e_commerce_bloc/common/bloc/products_bloc/products_details_bloc/select_size_cubit.dart';
import 'package:e_commerce_bloc/common/widgets/basic_app_bar.dart';
import 'package:e_commerce_bloc/core/configs/theme/app_colors.dart';
// import 'package:e_commerce_bloc/core/constants/product_colors.dart';
// import 'package:e_commerce_bloc/core/constants/product_sizes.dart';
import 'package:e_commerce_bloc/domain/product/entity/product_entity.dart';
import 'package:e_commerce_bloc/presentation/products/widgets/product_color_widget.dart';
import 'package:e_commerce_bloc/presentation/products/widgets/product_quantity_widget.dart';
import 'package:e_commerce_bloc/presentation/products/widgets/product_size_widget.dart';
// import 'package:e_commerce_bloc/presentation/products/widgets/selection_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:iconsax/iconsax.dart';

class ProductDetailsPage extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductDetailsPage({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (BuildContext context) => SelectSizeCubit()),
            BlocProvider(create: (BuildContext context) => SelectColorCubit()),
            BlocProvider(
              create: (BuildContext context) => ProductQuantityCubit(),
            ),
          ],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10.0,
            children: [
              SizedBox(
                height: 300,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            'assets/products/${productEntity.images[index]}',
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(width: 20.0),
                  itemCount: 2,
                ),
              ),
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
              // SelectionWidget(
              //   text: 'Color',
              // widget:
              //   dataSelection: productColors,
              // ),
              ProductQuantity(productEntity: productEntity),
            ],
          ),
        ),
      ),
    );
  }
}
