part of 'home_cubit.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    required bool isLoading,
    required Option<Either<MainFailure, HomeModel>> isFailureOrSuccess,
    required HomeModel? homeModel,
  }) = _Initial;

  factory HomeState.initial() =>
      HomeState(isLoading: false, isFailureOrSuccess: none(), homeModel: null);
}
