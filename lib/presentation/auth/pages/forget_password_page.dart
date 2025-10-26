import 'package:e_commerce_bloc/common/helper/app_navigator.dart';
import 'package:e_commerce_bloc/common/widgets/basic_app_bar.dart';
import 'package:e_commerce_bloc/common/widgets/basic_app_button.dart';
import 'package:e_commerce_bloc/presentation/auth/pages/enter_password_page.dart';
import 'package:flutter/material.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

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
              'Forgot Password',
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
          ],
        ),
      ),
    );
  }
}
