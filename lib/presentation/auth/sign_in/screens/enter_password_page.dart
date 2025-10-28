import 'package:e_commerce_bloc/common/bloc/button_bloc/button_cubit.dart';
import 'package:e_commerce_bloc/common/bloc/button_bloc/button_state.dart';
import 'package:e_commerce_bloc/common/helper/app_navigator.dart';
import 'package:e_commerce_bloc/common/widgets/basic_app_bar.dart';
import 'package:e_commerce_bloc/common/widgets/reactive_button_widget.dart';
import 'package:e_commerce_bloc/common/widgets/text_field_widget.dart';
import 'package:e_commerce_bloc/core/validation/input_validation.dart';
import 'package:e_commerce_bloc/data/auth/models/user_creation_model.dart';
import 'package:e_commerce_bloc/domain/auth/usecases/sign_in_use_case.dart';
import 'package:e_commerce_bloc/presentation/auth/forget_password/screens/forget_password_page.dart';
import 'package:e_commerce_bloc/services_locator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EnterPasswordPage extends StatelessWidget {
  final UserCreationModel user;
  EnterPasswordPage({super.key, required this.user});

  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ButtonCubit(),
      child: Scaffold(
        appBar: BasicAppbar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
          child: BlocListener<ButtonCubit, ButtonState>(
            listener: (buttonContext, state) {
              if (state is ButtonStateFailure) {
                ScaffoldMessenger.of(buttonContext).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              }

              if (state is ButtonStateSuccess) {
                ScaffoldMessenger.of(buttonContext).showSnackBar(
                  SnackBar(
                    content: Text('Successfully signed in!'),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 20.0,
              children: [
                const Text(
                  'Sign in',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),

                /// FORM
                Form(
                  key: _formKey,
                  child: TextFieldWidget(
                    controller: _passwordController,
                    text: 'Password',
                    validator: AppFieldValidator.validatePassword,
                  ),
                ),

                Builder(
                  builder: (innerContext) {
                    return ReactiveButtonWidget(
                      onPressed: () {
                        if (!_formKey.currentState!.validate()) return;

                        user.password = _passwordController.text.trim();

                        innerContext.read<ButtonCubit>().execute(
                          usecase: sl<SignInUseCase>(),
                          params: user,
                        );
                      },
                      title: 'Continue',
                    );
                  },
                ),

                /// FORGET PASSWORD TEXT
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(text: 'Forget your password? '),
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
        ),
      ),
    );
  }
}
