import 'package:e_commerce_bloc/common/helper/app_navigator.dart';
import 'package:e_commerce_bloc/common/widgets/basic_app_bar.dart';
import 'package:e_commerce_bloc/common/widgets/basic_app_button.dart';
import 'package:e_commerce_bloc/core/configs/assets/app_vectors.dart';
import 'package:e_commerce_bloc/presentation/auth/sign_in/screens/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SentEmailPage extends StatelessWidget {
  const SentEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(hideBack: true),
      body: Column(
        spacing: 30.0,
        children: [
          Center(child: SvgPicture.asset(AppVectors.emailSending)),
          const Center(
            child: Text('We Sent you an Email to reset your password.'),
          ),
          BasicAppButton(
            onPressed: () {
              AppNavigator.pushReplacement(context, SigninPage());
            },
            title: 'Return to Login',
          ),
        ],
      ),
    );
  }
}
