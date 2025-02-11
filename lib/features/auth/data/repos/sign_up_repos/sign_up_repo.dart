import 'package:dartz/dartz.dart';
import '../../../../../core/failures/failures.dart';
import '../../models/sign_up_models/sign_up_request_body.dart';
import '../../models/sign_up_models/sign_up_response_body.dart';

abstract class SignUpRepo {
  Future<Either<Failures, SignUpResponseBody>> signUp(
      { required SignUpRequestBody signUpRequestBody});
}
