import 'dart:developer';

import 'package:e_commerce_bloc/common/helper/app_navigator.dart';
import 'package:e_commerce_bloc/common/widgets/basic_app_bar.dart';
import 'package:e_commerce_bloc/common/widgets/basic_app_button.dart';
import 'package:e_commerce_bloc/common/widgets/text_field_widget.dart';
import 'package:e_commerce_bloc/data/auth/models/user_creation_model.dart';
import 'package:e_commerce_bloc/presentation/auth/pages/gender_age_selection_page.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 20.0,
          children: [
            Text(
              'Create Account',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Form(
              key: _formKey,
              child: Column(
                spacing: 20.0,
                children: [
                  TextFieldWidget(
                    controller: _firstNameController,
                    text: 'First Name',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                  ),
                  TextFieldWidget(
                    controller: _lastNameController,
                    text: 'Last Name',
                  ),
                  TextFieldWidget(controller: _emailController, text: 'Email'),
                  TextFieldWidget(
                    controller: _passwordController,
                    text: 'Password',
                  ),
                ],
              ),
            ),
            BasicAppButton(
              onPressed: () {
                if (!_formKey.currentState!.validate()) {
                  log('dddd');
                  return;
                }
                AppNavigator.push(
                  context,
                  GenderAgeSelectionPage(
                    user: UserCreationModel(
                      firstName: _firstNameController.text.trim(),
                      lastName: _lastNameController.text.trim(),
                      email: _emailController.text.trim(),
                      password: _passwordController.text.trim(),
                    ),
                  ),
                );
              },
              title: 'Continue',
            ),
          ],
        ),
      ),
    );
  }
}
