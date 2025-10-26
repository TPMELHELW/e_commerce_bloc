// import 'package:e_commerce_bloc/domain/auth/usecases/get_ages_use_case.dart';
// import 'package:e_commerce_bloc/presentation/auth/bloc/age_display_state.dart';
// import 'package:e_commerce_bloc/services_locator.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class AgeDisplayCubit extends Cubit<AgeDisplayState> {
//   // AgeDisplayCubit(super.initialState);
//   AgeDisplayCubit() : super(AgesLoadingState());

//   Future<void> displayAges() async {
//     final returnedData = await sl<GetAgesUseCase>().call();

//     returnedData.fold(
//       (message) {
//         emit(AgesFailureState(message: message));
//       },
//       (ages) {
//         emit(AgesLoadedState(ages: ages));
//       },
//     );
//   }
// }
