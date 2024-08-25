import 'package:dartz/dartz.dart';
import 'package:wellnest/Domain/Failure/failure.dart';

abstract class HomeService {
  Future<Either<MainFailure, Unit>> getDetails();
}
