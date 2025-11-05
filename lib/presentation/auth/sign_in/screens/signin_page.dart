import 'package:e_commerce_bloc/common/helper/app_navigator.dart';
import 'package:e_commerce_bloc/common/widgets/basic_app_bar.dart';
import 'package:e_commerce_bloc/common/widgets/basic_app_button.dart';
import 'package:e_commerce_bloc/common/widgets/text_field_widget.dart';
import 'package:e_commerce_bloc/core/validation/input_validation.dart';
import 'package:e_commerce_bloc/data/auth/models/user_creation_model.dart';
import 'package:e_commerce_bloc/presentation/auth/sign_in/screens/enter_password_page.dart';
import 'package:e_commerce_bloc/presentation/auth/sign_up/screens/signup_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

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
              key: _formKey,
              child: TextFieldWidget(
                controller: _emailController,
                text: 'Email',
                validator: (String? value) =>
                    AppFieldValidator.validateEmail(value),
              ),
            ),
            BasicAppButton(
              onPressed: () {
                if (!_formKey.currentState!.validate()) {
                  return;
                }
                AppNavigator.push(
                  context,
                  EnterPasswordPage(
                    user: UserCreationModel(email: _emailController.text),
                  ),
                );
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
