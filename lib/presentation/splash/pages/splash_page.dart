import 'package:e_commerce_bloc/common/helper/app_navigator.dart';
import 'package:e_commerce_bloc/core/configs/assets/app_vectors.dart';
import 'package:e_commerce_bloc/presentation/auth/sign_in/screens/signin_page.dart';
import 'package:e_commerce_bloc/presentation/home/pages/home_page.dart';
import 'package:e_commerce_bloc/presentation/splash/bloc/splash_cubit.dart';
import 'package:e_commerce_bloc/presentation/splash/bloc/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is UnAuthenticated) {
          AppNavigator.pushReplacement(context, SigninPage());
        }
        if (state is Authenticated) {
          AppNavigator.pushReplacement(context, HomePage());
        }
      },
      child: Scaffold(body: Center(child: SvgPicture.asset(AppVectors.logo))),
    );
  }
}
