import 'package:e_commerce_bloc/common/widgets/product_widget.dart';
import 'package:e_commerce_bloc/domain/product/entity/product_entity.dart';
import 'package:flutter/material.dart';

class ProductGridWidget extends StatelessWidget {
  final List<ProductEntity> products;
  const ProductGridWidget({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.6,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductWidget(productEntity: products[index]);
        },
      ),
    );
  }
}
