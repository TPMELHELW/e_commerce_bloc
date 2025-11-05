// import 'package:ecommerce/common/helper/navigator/app_navigator.dart';
// import 'package:ecommerce/core/configs/theme/app_colors.dart';
// import 'package:e_commerce_bloc/common/helper/app_navigator.dart';
import 'package:e_commerce_bloc/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';

// import '../pages/my_favorites.dart';

class ItemWidget extends StatelessWidget {
  final String text;
  final void Function()? onPress;
  const ItemWidget({super.key, required this.text, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.secondBackground,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            ),
            Icon(Icons.arrow_forward_ios_rounded),
          ],
        ),
      ),
    );
  }
}
