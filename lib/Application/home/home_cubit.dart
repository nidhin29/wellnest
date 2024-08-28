import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:wellnest/Domain/Failure/failure.dart';
import 'package:wellnest/Domain/Home/home_model.dart';
import 'package:wellnest/Domain/Home/home_service.dart';
part 'home_state.dart';
part 'home_cubit.freezed.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final HomeService _homeService;
  HomeCubit(this._homeService) : super(HomeState.initial());

  getDetails() async {
    emit(state.copyWith(
      isLoading: true,
      isFailureOrSuccess: none(),
    ));
    final response = await _homeService.getDetails();
    response.fold((l) => emit(state.copyWith(
      isLoading: false,
      isFailureOrSuccess : some(left(l))
    )), (r) => emit(
      state.copyWith(
        isLoading: false,
        homeModel: r,
        isFailureOrSuccess: some(right(r),
        )
      )
    ));
  }
}
