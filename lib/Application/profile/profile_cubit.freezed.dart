// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfileState {
  bool get isLoading => throw _privateConstructorUsedError;
  Option<Either<MainFailure, Model>> get isFailureOrSuccessForGet =>
      throw _privateConstructorUsedError;
  Option<Either<MainFailure, Unit>> get isFailureOrSuccessForUpdate =>
      throw _privateConstructorUsedError;
  Model? get profileModel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileStateCopyWith<ProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileStateCopyWith<$Res> {
  factory $ProfileStateCopyWith(
          ProfileState value, $Res Function(ProfileState) then) =
      _$ProfileStateCopyWithImpl<$Res, ProfileState>;
  @useResult
  $Res call(
      {bool isLoading,
      Option<Either<MainFailure, Model>> isFailureOrSuccessForGet,
      Option<Either<MainFailure, Unit>> isFailureOrSuccessForUpdate,
      Model? profileModel});
}

/// @nodoc
class _$ProfileStateCopyWithImpl<$Res, $Val extends ProfileState>
    implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isFailureOrSuccessForGet = null,
    Object? isFailureOrSuccessForUpdate = null,
    Object? profileModel = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailureOrSuccessForGet: null == isFailureOrSuccessForGet
          ? _value.isFailureOrSuccessForGet
          : isFailureOrSuccessForGet // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, Model>>,
      isFailureOrSuccessForUpdate: null == isFailureOrSuccessForUpdate
          ? _value.isFailureOrSuccessForUpdate
          : isFailureOrSuccessForUpdate // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, Unit>>,
      profileModel: freezed == profileModel
          ? _value.profileModel
          : profileModel // ignore: cast_nullable_to_non_nullable
              as Model?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $ProfileStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      Option<Either<MainFailure, Model>> isFailureOrSuccessForGet,
      Option<Either<MainFailure, Unit>> isFailureOrSuccessForUpdate,
      Model? profileModel});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isFailureOrSuccessForGet = null,
    Object? isFailureOrSuccessForUpdate = null,
    Object? profileModel = freezed,
  }) {
    return _then(_$InitialImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailureOrSuccessForGet: null == isFailureOrSuccessForGet
          ? _value.isFailureOrSuccessForGet
          : isFailureOrSuccessForGet // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, Model>>,
      isFailureOrSuccessForUpdate: null == isFailureOrSuccessForUpdate
          ? _value.isFailureOrSuccessForUpdate
          : isFailureOrSuccessForUpdate // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, Unit>>,
      profileModel: freezed == profileModel
          ? _value.profileModel
          : profileModel // ignore: cast_nullable_to_non_nullable
              as Model?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {required this.isLoading,
      required this.isFailureOrSuccessForGet,
      required this.isFailureOrSuccessForUpdate,
      required this.profileModel});

  @override
  final bool isLoading;
  @override
  final Option<Either<MainFailure, Model>> isFailureOrSuccessForGet;
  @override
  final Option<Either<MainFailure, Unit>> isFailureOrSuccessForUpdate;
  @override
  final Model? profileModel;

  @override
  String toString() {
    return 'ProfileState(isLoading: $isLoading, isFailureOrSuccessForGet: $isFailureOrSuccessForGet, isFailureOrSuccessForUpdate: $isFailureOrSuccessForUpdate, profileModel: $profileModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(
                    other.isFailureOrSuccessForGet, isFailureOrSuccessForGet) ||
                other.isFailureOrSuccessForGet == isFailureOrSuccessForGet) &&
            (identical(other.isFailureOrSuccessForUpdate,
                    isFailureOrSuccessForUpdate) ||
                other.isFailureOrSuccessForUpdate ==
                    isFailureOrSuccessForUpdate) &&
            (identical(other.profileModel, profileModel) ||
                other.profileModel == profileModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading,
      isFailureOrSuccessForGet, isFailureOrSuccessForUpdate, profileModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements ProfileState {
  const factory _Initial(
      {required final bool isLoading,
      required final Option<Either<MainFailure, Model>>
          isFailureOrSuccessForGet,
      required final Option<Either<MainFailure, Unit>>
          isFailureOrSuccessForUpdate,
      required final Model? profileModel}) = _$InitialImpl;

  @override
  bool get isLoading;
  @override
  Option<Either<MainFailure, Model>> get isFailureOrSuccessForGet;
  @override
  Option<Either<MainFailure, Unit>> get isFailureOrSuccessForUpdate;
  @override
  Model? get profileModel;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
