import 'package:dartz/dartz.dart';
import 'package:wellnest/Domain/Failure/failure.dart';
import 'package:wellnest/Domain/Profile/model.dart';
import 'package:wellnest/Domain/Profile/profile_model.dart';

abstract class ProfileService {
  Future<Either<MainFailure, Model>> getProfile();
  Future<Either<MainFailure, Unit>> updateProfile(
      {required ProfileModel profileModel});
}
