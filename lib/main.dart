import 'package:e_commerce_bloc/core/configs/theme/app_theme.dart';
import 'package:e_commerce_bloc/firebase_options.dart';
import 'package:e_commerce_bloc/presentation/splash/bloc/splash_cubit.dart';
import 'package:e_commerce_bloc/presentation/splash/pages/splash_page.dart';
import 'package:e_commerce_bloc/services_locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initServicesLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SplashCubit()..appStarted(),
      child: MaterialApp(theme: AppTheme.appTheme, home: SplashPage()),
    );
  }
}
