import 'package:e_commerce_bloc/common/helper/app_navigator.dart';
import 'package:e_commerce_bloc/core/configs/theme/app_colors.dart';
import 'package:e_commerce_bloc/presentation/cart/pages/cart_page.dart';
import 'package:e_commerce_bloc/presentation/home/bloc/user_info_bloc/user_info_cubit.dart';
import 'package:e_commerce_bloc/presentation/home/bloc/user_info_bloc/user_info_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserInfoCubit>(
      create: (BuildContext context) => UserInfoCubit()..getData(),
      child: BlocBuilder<UserInfoCubit, UserInfoState>(
        builder: (context, state) {
          if (state is UserInfoLoadingState) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is UserInfoLoadedState) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(radius: 30.0),
                Container(
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: AppColors.secondBackground,
                  ),
                  child: Row(
                    children: [
                      Text(state.userData.gender),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    AppNavigator.push(context, CartPage());
                  },
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Icon(Iconsax.bag),
                  ),
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
