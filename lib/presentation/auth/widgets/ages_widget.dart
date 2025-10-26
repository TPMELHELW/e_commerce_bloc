import 'package:e_commerce_bloc/core/constants/ages_range.dart';
import 'package:e_commerce_bloc/presentation/auth/bloc/age_selection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AgesWidget extends StatelessWidget {
  final BuildContext ageSelectionContext;
  const AgesWidget({super.key, required this.ageSelectionContext});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(19.0),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pop(context);
            ageSelectionContext.read<AgeSelectionCubit>().selectAge(
              ageRanges[index],
            );
          },
          child: Text(ageRanges[index], style: const TextStyle(fontSize: 18)),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemCount: ageRanges.length,
    );
  }
}
