part of 'signup_cubit.dart';

@freezed
abstract class SignupState with _$SignupState {
 const factory SignupState({
    required bool isLoading,
    required Option<Either<MainFailure,Unit>> isFailureOrSuccess,
  }) = _SigninState;

  factory SignupState.initial() => SignupState(
    isLoading: false,
    isFailureOrSuccess: none(),
  );
}
