import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:wellnest/Application/edit_profile/editprofile_cubit.dart';
import 'package:wellnest/Application/home/home_cubit.dart';
import 'package:wellnest/Application/loggedin/loggedin_cubit.dart';
import 'package:wellnest/Application/profile/profile_cubit.dart';
import 'package:wellnest/Application/signin/signin_cubit.dart';
import 'package:wellnest/Application/signup/signup_cubit.dart';
import 'package:wellnest/Presentation/Splash/splash.dart';
import 'package:wellnest/core/injectable/injectable.dart';

void main(List<String> args) async {
  await configureInjection(Environment.prod);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SigninCubit>(create: (context) => getIt<SigninCubit>()),
        BlocProvider<HomeCubit>(create: (context) => getIt<HomeCubit>()),
        BlocProvider<SignupCubit>(create: (context) => getIt<SignupCubit>()),
        BlocProvider<LoggedinCubit>(
            create: (context) => getIt<LoggedinCubit>()),
        BlocProvider<ProfileCubit>(create: (context) => getIt<ProfileCubit>()),
         BlocProvider<EditprofileCubit>(create: (context) => getIt<EditprofileCubit>())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
      ),
    );
  }
}
