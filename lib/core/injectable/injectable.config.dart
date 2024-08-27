// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:wellnest/Application/edit_profile/editprofile_cubit.dart'
    as _i317;
import 'package:wellnest/Application/home/home_cubit.dart' as _i914;
import 'package:wellnest/Application/loggedin/loggedin_cubit.dart' as _i802;
import 'package:wellnest/Application/profile/profile_cubit.dart' as _i890;
import 'package:wellnest/Application/signin/signin_cubit.dart' as _i623;
import 'package:wellnest/Application/signup/signup_cubit.dart' as _i340;
import 'package:wellnest/Domain/Home/home_service.dart' as _i697;
import 'package:wellnest/Domain/LoggedIn/logged_in_service.dart' as _i713;
import 'package:wellnest/Domain/Profile/profile_service.dart' as _i606;
import 'package:wellnest/Domain/SignIn/sign_in_service.dart' as _i949;
import 'package:wellnest/Domain/SignUp/signup_service.dart' as _i244;
import 'package:wellnest/Domain/TokenManager/token_service.dart' as _i20;
import 'package:wellnest/Infrastructure/Home/home_repo.dart' as _i171;
import 'package:wellnest/Infrastructure/LoggedIn/logged_in_repo.dart' as _i122;
import 'package:wellnest/Infrastructure/Profile/profile_repo.dart' as _i437;
import 'package:wellnest/Infrastructure/SignIn/sign_in_repo.dart' as _i193;
import 'package:wellnest/Infrastructure/SignUp/signup_repo.dart' as _i288;
import 'package:wellnest/Infrastructure/TokenManager/token_repo.dart' as _i222;

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
    gh.lazySingleton<_i697.HomeService>(() => _i171.HomeRepo());
    gh.lazySingleton<_i20.TokenService>(() => _i222.TokenRepo());
    gh.lazySingleton<_i949.SignInService>(() => _i193.SignInRepo());
    gh.lazySingleton<_i606.ProfileService>(() => _i437.ProfileRepo());
    gh.lazySingleton<_i713.LoggedInService>(() => _i122.LoggedInRepo());
    gh.factory<_i802.LoggedinCubit>(
        () => _i802.LoggedinCubit(gh<_i713.LoggedInService>()));
    gh.factory<_i914.HomeCubit>(() => _i914.HomeCubit(gh<_i697.HomeService>()));
    gh.lazySingleton<_i244.SignUpService>(() => _i288.SignUpRepo());
    gh.factory<_i623.SigninCubit>(() => _i623.SigninCubit(
          gh<_i949.SignInService>(),
          gh<_i20.TokenService>(),
        ));
    gh.factory<_i890.ProfileCubit>(() => _i890.ProfileCubit(
          gh<_i606.ProfileService>(),
          gh<_i20.TokenService>(),
        ));
    gh.factory<_i340.SignupCubit>(() => _i340.SignupCubit(
          gh<_i244.SignUpService>(),
          gh<_i20.TokenService>(),
        ));
    gh.factory<_i317.EditprofileCubit>(
        () => _i317.EditprofileCubit(gh<_i606.ProfileService>()));
    return this;
  }
}
