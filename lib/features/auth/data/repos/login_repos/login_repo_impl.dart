import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:todo_tasky/core/failures/failures.dart';
import 'package:todo_tasky/core/networking/api_service.dart';
import 'package:todo_tasky/features/auth/data/models/login_models/login_response_body.dart';
import 'package:todo_tasky/features/auth/data/models/login_models/login_request_body.dart';
import 'login_repo.dart';

class LoginRepoImpl implements LoginRepo {
  final ApiService apiService;

  LoginRepoImpl(this.apiService);

  @override
  Future<Either<Failures, LoginResponseBody>> login(
      LoginRequestBody loginRequestBody) async {
    try {
      var response = await apiService.login(
        endPoint: 'auth/login',
        loginRequestBody: loginRequestBody,
      );
      return right(LoginResponseBody.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
