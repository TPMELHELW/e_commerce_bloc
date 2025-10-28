import 'package:e_commerce_bloc/common/bloc/button_bloc/button_cubit.dart';
import 'package:e_commerce_bloc/common/helper/app_bottom_sheet.dart';
import 'package:e_commerce_bloc/common/widgets/basic_app_bar.dart';
import 'package:e_commerce_bloc/common/widgets/reactive_button_widget.dart';
import 'package:e_commerce_bloc/core/configs/theme/app_colors.dart';
import 'package:e_commerce_bloc/data/auth/models/user_creation_model.dart';
import 'package:e_commerce_bloc/domain/auth/usecases/signup_use_case.dart';
import 'package:e_commerce_bloc/presentation/auth/sign_up/bloc/age_selection_cubit.dart';
import 'package:e_commerce_bloc/presentation/auth/sign_up/bloc/gender_selection_cubit.dart';
import 'package:e_commerce_bloc/presentation/auth/sign_up/widgets/ages_widget.dart';
import 'package:e_commerce_bloc/presentation/auth/sign_up/widgets/gender_selection_widget.dart';
import 'package:e_commerce_bloc/services_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenderAgeSelectionPage extends StatelessWidget {
  final UserCreationModel user;
  const GenderAgeSelectionPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) => GenderSelectionCubit(),
          ),
          BlocProvider(create: (BuildContext context) => AgeSelectionCubit()),
          BlocProvider(create: (BuildContext context) => ButtonCubit()),
        ],
        child: BlocBuilder<AgeSelectionCubit, String>(
          builder: (context, state) {
            return Column(
              spacing: 20.0,
              children: [
                Text(
                  'Tell us about yourself',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
                BlocBuilder<GenderSelectionCubit, int>(
                  builder: (context, state) {
                    return Row(
                      children: [
                        GenderSelectionWidget(gender: 'Male', index: 0),
                        GenderSelectionWidget(gender: 'Female', index: 1),
                      ],
                    );
                  },
                ),
                Text(
                  'How old are you?',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                GestureDetector(
                  onTap: () {
                    AppBottomsheet.display(
                      context,
                      AgesWidget(ageSelectionContext: context),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 15.0),
                    padding: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: AppColors.secondBackground,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text(state), Icon(Icons.keyboard_arrow_down)],
                    ),
                  ),
                ),

                Spacer(),
                Container(
                  height: 100,
                  color: AppColors.secondBackground,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Center(
                    child: ReactiveButtonWidget(
                      onPressed: () {
                        user.gender =
                            context
                                    .read<GenderSelectionCubit>()
                                    .selectedGender ==
                                0
                            ? 'Male'
                            : 'Female';
                        user.age = context.read<AgeSelectionCubit>().state;

                        context.read<ButtonCubit>().execute(
                          usecase: sl<SignupUseCase>(),
                          params: user,
                        );
                      },
                      title: 'Finish',
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
