import 'package:dartz/dartz.dart';
import '../../../../../core/failures/failures.dart';
import '../../models/login_models/login_response_body.dart';
import '../../models/login_models/login_request_body.dart';

abstract class LoginRepo {
  Future<Either<Failures, LoginResponseBody>> login(
      LoginRequestBody loginRequestBody);
}
