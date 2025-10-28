import 'package:e_commerce_bloc/common/widgets/product_widget.dart';
import 'package:e_commerce_bloc/domain/product/entity/product_entity.dart';
import 'package:flutter/widgets.dart';

class SearchResultWidget extends StatelessWidget {
  final List<ProductEntity> products;
  const SearchResultWidget({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: products.length,
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.6,
      ),
      itemBuilder: (BuildContext context, int index) {
        return ProductWidget(productEntity: products[index]);
      },
    );
  }
}
