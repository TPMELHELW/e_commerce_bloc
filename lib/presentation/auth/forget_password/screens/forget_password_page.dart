import 'package:e_commerce_bloc/common/button_bloc/button_cubit.dart';
import 'package:e_commerce_bloc/common/button_bloc/button_state.dart';
import 'package:e_commerce_bloc/common/helper/app_navigator.dart';
import 'package:e_commerce_bloc/common/widgets/basic_app_bar.dart';
import 'package:e_commerce_bloc/common/widgets/reactive_button_widget.dart';
import 'package:e_commerce_bloc/common/widgets/text_field_widget.dart';
import 'package:e_commerce_bloc/core/validation/input_validation.dart';
import 'package:e_commerce_bloc/domain/auth/usecases/forget_password_use_case.dart';
import 'package:e_commerce_bloc/presentation/auth/forget_password/screens/sent_email_page.dart';
import 'package:e_commerce_bloc/services_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordPage extends StatelessWidget {
  ForgetPasswordPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _keyForm = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(),
      body: BlocProvider<ButtonCubit>(
        create: (BuildContext context) => ButtonCubit(),
        child: BlocListener<ButtonCubit, ButtonState>(
          listener: (BuildContext context, state) {
            if (state is ButtonStateFailure) {
              var snackbar = SnackBar(
                content: Text(state.message),
                behavior: SnackBarBehavior.floating,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            }

            if (state is ButtonStateSuccess) {
              AppNavigator.push(context, const SentEmailPage());
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 30.0,
              horizontal: 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 20.0,
              children: [
                Text(
                  'Forgot Password',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                Form(
                  key: _keyForm,
                  child: TextFieldWidget(
                    controller: _emailController,
                    text: 'Email',
                    validator: (String? value) =>
                        AppFieldValidator.validateEmail(value),
                  ),
                ),
                Builder(
                  builder: (context) {
                    return ReactiveButtonWidget(
                      onPressed: () {
                        if (!_keyForm.currentState!.validate()) {
                          return;
                        }
                        context.read<ButtonCubit>().execute(
                          usecase: sl<ForgetPasswordUseCase>(),
                          params: _emailController.text.trim(),
                        );
                      },
                      title: 'Continue',
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
