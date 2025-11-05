// import 'package:ecommerce/common/helper/navigator/app_navigator.dart';
// import 'package:ecommerce/common/widgets/button/basic_app_button.dart';
// import 'package:ecommerce/core/configs/assets/app_images.dart';
// import 'package:ecommerce/core/configs/theme/app_colors.dart';
// import 'package:ecommerce/presentation/home/pages/home.dart';
import 'package:e_commerce_bloc/common/helper/app_navigator.dart';
import 'package:e_commerce_bloc/common/widgets/basic_app_button.dart';
import 'package:e_commerce_bloc/core/configs/theme/app_colors.dart';
import 'package:e_commerce_bloc/presentation/home/pages/home_page.dart';
import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset('assets/images/order_success.png'),
          ),
          const SizedBox(height: 60),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 300,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: const BoxDecoration(
                color: AppColors.secondBackground,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Order Placed Successfully',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(height: 30),
                  BasicAppButton(
                    title: 'Finish',
                    onPressed: () {
                      AppNavigator.pushAndRemove(context, const HomePage());
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
