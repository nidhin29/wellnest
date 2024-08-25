import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:wellnest/Domain/Failure/failure.dart';
import 'package:wellnest/Domain/Profile/model.dart';
import 'package:wellnest/Domain/Profile/profile_model.dart';
import 'package:wellnest/Domain/Profile/profile_service.dart';
import 'package:wellnest/Domain/TokenManager/token_manager.dart';
import 'package:wellnest/Presentation/constants/constants.dart';

@LazySingleton(as: ProfileService)
class ProfileRepo implements ProfileService {
  @override
  Future<Either<MainFailure, Model>> getProfile() async {
    try {
      final email = TokenManager.instance.email;

      final Map<String, dynamic> headers = {
        'Content-Type': 'application/json',
      };
      final Response response = await Dio(BaseOptions(headers: headers))
          .get("${baseUrl}api/UserProfile", data: {
        'email': email,
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());
        final profileModel = Model.fromJson(response.data);
        return Right(profileModel);
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

  @override
  Future<Either<MainFailure, Unit>> updateProfile(
      {required ProfileModel profileModel}) async {
    try {
      final email = TokenManager.instance.email;
      final Map<String, dynamic> headers = {
        'Content-Type': 'application/json',
      };
      final Response response = await Dio(BaseOptions(headers: headers))
          .put("${baseUrl}api/UserProfile", data: {
        'email': email,
        'name': profileModel.name,
        'age': profileModel.age,
        'gender': profileModel.gender,
        'address': profileModel.weightAddress,
        'api_key': profileModel.facebookApi,
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());
        return const Right(unit);
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
