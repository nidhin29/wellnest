// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:wellnest/Application/signin_cubit.dart' as _i610;
import 'package:wellnest/Domain/SignIn/sign_in_service.dart' as _i949;
import 'package:wellnest/Infrastructure/SignIn/sign_in_repo.dart' as _i193;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i949.SignInService>(() => _i193.SignInRepo());
    gh.factory<_i610.SigninCubit>(
        () => _i610.SigninCubit(gh<_i949.SignInService>()));
    return this;
  }
}
