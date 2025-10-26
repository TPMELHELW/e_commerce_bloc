import 'package:e_commerce_bloc/common/helper/app_navigator.dart';
import 'package:e_commerce_bloc/common/widgets/basic_app_bar.dart';
import 'package:e_commerce_bloc/common/widgets/basic_app_button.dart';
import 'package:e_commerce_bloc/presentation/auth/pages/enter_password_page.dart';
import 'package:e_commerce_bloc/presentation/auth/pages/signup_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(hideBack: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 20.0,
          children: [
            Text(
              'Sign in',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Form(
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
              ),
            ),
            BasicAppButton(
              onPressed: () {
                AppNavigator.push(context, EnterPasswordPage());
              },
              title: 'Continue',
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: 'Do not have an account? '),
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        AppNavigator.push(context, SignupPage());
                      },
                    text: 'Sign up',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
