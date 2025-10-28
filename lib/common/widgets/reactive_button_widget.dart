import 'package:e_commerce_bloc/common/bloc/button_bloc/button_cubit.dart';
import 'package:e_commerce_bloc/common/bloc/button_bloc/button_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReactiveButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double? height;
  const ReactiveButtonWidget({
    required this.onPressed,
    required this.title,
    this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ButtonCubit, ButtonState>(
      builder: (context, state) {
        if (state is ButtonStateLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ButtonStateFailure) {
          return Text('Error: ${state.message}');
        } else {
          return ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50.0),
              maximumSize: Size(double.infinity, height ?? 50),
            ),
            child: Text(title),
          );
        }
      },
    );
  }
}
