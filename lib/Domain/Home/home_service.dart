import 'package:dartz/dartz.dart';
import 'package:wellnest/Domain/Failure/failure.dart';
import 'package:wellnest/Domain/Home/home_model.dart';

abstract class HomeService {
  Future<Either<MainFailure, HomeModel>> getDetails();
}
