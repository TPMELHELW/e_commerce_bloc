import 'package:e_commerce_bloc/common/helper/app_navigator.dart';
import 'package:e_commerce_bloc/common/widgets/basic_app_bar.dart';
import 'package:e_commerce_bloc/common/widgets/basic_app_button.dart';
import 'package:e_commerce_bloc/presentation/auth/pages/forget_password_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class EnterPasswordPage extends StatelessWidget {
  const EnterPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(),
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
                decoration: InputDecoration(labelText: 'Password'),
              ),
            ),
            BasicAppButton(onPressed: () {}, title: 'Continue'),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: 'Forget your password? '),
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        AppNavigator.push(context, ForgetPasswordPage());
                      },
                    text: 'Reset it',
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
