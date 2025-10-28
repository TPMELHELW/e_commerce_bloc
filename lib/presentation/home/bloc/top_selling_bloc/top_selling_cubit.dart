// import 'package:dartz/dartz.dart';
// import 'package:e_commerce_bloc/domain/product/entity/product_entity.dart';
// import 'package:e_commerce_bloc/domain/product/usecase/get_top_seller_use_case.dart';
// import 'package:e_commerce_bloc/presentation/home/bloc/top_selling_bloc/top_selling_state.dart';
// import 'package:e_commerce_bloc/services_locator.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class TopSellingCubit extends Cubit<TopSellingState> {
//   TopSellingCubit() : super(TopSellingLoadingState());

//   void getTopSellingProducts() async {
//     final Either<String, List<ProductEntity>> data =
//         await sl<GetTopSellerUseCase>().call();

//     data.fold(
//       (error) {
//         emit(TopSellingFailureState());
//       },
//       (data) {
//         emit(TopSellingLoadedState(topSellingProducts: data));
//       },
//     );
//   }
// }
