import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wellnest/Domain/Failure/failure.dart';
import 'package:wellnest/Domain/Home/home_model.dart';
import 'package:wellnest/Domain/Home/home_service.dart';
import 'package:wellnest/Presentation/constants/constants.dart';

@LazySingleton(as: HomeService)
class HomeRepo implements HomeService {
  @override
  Future<Either<MainFailure, HomeModel>> getDetails() async {
    try {
      final sha = await SharedPreferences.getInstance();
      final email = sha.getString('email');
      final Map<String, dynamic> headers = {
        'Content-Type': 'application/json',
      };
      final Response response = await Dio(BaseOptions(headers: headers))
          .get("${baseUrl}api/UserHome", data: {
        "email": email,
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());
        final homeModel = HomeModel.fromJson(response.data);
        return Right(homeModel);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      if (e is DioException && e.response?.statusCode == 500) {
        return const Left(MainFailure.serverFailure());
      } else if (e is SocketException) {
        return const Left(MainFailure.clientFailure());
      } else if (e is DioException && e.response?.statusCode == 404) {
        return const Left(MainFailure.authFailure());
      } else if (e is DioException && e.response?.statusCode == 400) {
        return const Left(MainFailure.incorrectCredential());
      } else {
        return const Left(MainFailure.otherFailure());
      }
    }
  }
}
