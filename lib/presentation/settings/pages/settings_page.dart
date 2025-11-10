import 'package:e_commerce_bloc/common/helper/app_navigator.dart';
import 'package:e_commerce_bloc/common/widgets/basic_app_bar.dart';
import 'package:e_commerce_bloc/domain/auth/usecases/sign_out_use_case.dart';
import 'package:e_commerce_bloc/presentation/auth/sign_in/screens/signin_page.dart';
import 'package:e_commerce_bloc/presentation/settings/pages/favourite_page.dart';
import 'package:e_commerce_bloc/presentation/settings/pages/my_order_page.dart';
import 'package:e_commerce_bloc/presentation/settings/widgets/item_widget.dart';
import 'package:e_commerce_bloc/services_locator.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(title: Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 10.0,
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
            SizedBox(height: 20.0),
            ItemWidget(
              text: 'My Favourites',
              onPress: () => AppNavigator.push(context, FavouritePage()),
            ),
            ItemWidget(
              text: 'My Orders',
              onPress: () => AppNavigator.push(context, MyOrderPage()),
            ),
            TextButton(
              onPressed: () {
                sl<SignOutUseCase>().call();
                AppNavigator.pushAndRemove(context, SigninPage());
              },
              style: TextButton.styleFrom(foregroundColor: Colors.redAccent),
              child: Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
