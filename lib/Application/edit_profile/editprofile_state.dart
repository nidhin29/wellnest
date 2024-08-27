part of 'editprofile_cubit.dart';

@freezed
abstract class EditprofileState with _$EditprofileState {
  const factory EditprofileState({
    required bool isLoading,
    required Option<Either<MainFailure,Unit>> isFailureOrSuccessForUpdate,
  }) = _Initial;

  factory EditprofileState.initial() => EditprofileState(
    isLoading: false,
    isFailureOrSuccessForUpdate: none(),
  );
}
