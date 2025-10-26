import 'package:e_commerce_bloc/core/configs/theme/app_colors.dart';
import 'package:e_commerce_bloc/presentation/auth/bloc/gender_selection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenderSelectionWidget extends StatelessWidget {
  final String gender;
  final int index;
  // final BuildContext cubitContext;
  const GenderSelectionWidget({
    super.key,
    required this.gender,
    required this.index,
    // required this.cubitContext,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          context.read<GenderSelectionCubit>().selectGender(index);
        },
        child: Container(
          margin: EdgeInsets.all(25.0),
          padding: EdgeInsets.all(10.0),
          height: 60,
          decoration: BoxDecoration(
            color: context.read<GenderSelectionCubit>().selectedGender == index
                ? AppColors.primary
                : AppColors.secondBackground,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Center(child: Text(gender)),
        ),
      ),
    );
  }
}
