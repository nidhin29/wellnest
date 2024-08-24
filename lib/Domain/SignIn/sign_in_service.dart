import 'package:dartz/dartz.dart';
import 'package:wellnest/Domain/Failure/failure.dart';


abstract class SignInService {
  Future<Either<MainFailure,Unit>> signInWithEmailAndPassword(String email, String password);
}