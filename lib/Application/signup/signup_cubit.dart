import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:wellnest/Domain/Failure/failure.dart';
import 'package:wellnest/Domain/SignUp/signup_service.dart';
part 'signup_state.dart';
part 'signup_cubit.freezed.dart';

@injectable
class SignupCubit extends Cubit<SignupState> {
  final SignUpService _signUpService;
  SignupCubit(this._signUpService) : super(SignupState.initial());

  signUp({required String email, required String password}) async {
    emit(state.copyWith(
      isLoading: true,
      isFailureOrSuccess: none(),
    ));
    final Either<MainFailure, Unit> response =
        await _signUpService.signUp(email: email, password: password);
    response.fold(
      (l) => emit(state.copyWith(
        isLoading: false,
        isFailureOrSuccess: some(left(l)),
      )),
      (r) => emit(state.copyWith(
        isLoading: false,
        isFailureOrSuccess: some(right(r)),
      )),
    );
  }
}
