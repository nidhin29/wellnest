import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:wellnest/Domain/Failure/failure.dart';
import 'package:wellnest/Domain/SignIn/sign_in_service.dart';

part 'signin_state.dart';
part 'signin_cubit.freezed.dart';

@injectable
class SigninCubit extends Cubit<SigninState> {
  final SignInService _signInService;
  SigninCubit(this._signInService) : super(SigninState.initial());

  signIn(String email, String password) async {
    emit(state.copyWith(
      isLoading: true,
      isFailureOrSuccess: none(),
    ));
    final Either<MainFailure, Unit> response =
        await _signInService.signInWithEmailAndPassword(email, password);
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
