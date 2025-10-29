import 'package:e_commerce_bloc/domain/product/entity/product_entity.dart';
import 'package:flutter/widgets.dart';

class ProductImagesWidget extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductImagesWidget({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}
