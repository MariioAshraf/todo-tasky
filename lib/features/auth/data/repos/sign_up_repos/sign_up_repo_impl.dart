import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:todo_tasky/core/failures/failures.dart';
import 'package:todo_tasky/core/networking/api_service.dart';
import 'package:todo_tasky/features/auth/data/models/sign_up_models/sign_up_request_body.dart';
import 'package:todo_tasky/features/auth/data/models/sign_up_models/sign_up_response_body.dart';
import 'package:todo_tasky/features/auth/data/repos/sign_up_repos/sign_up_repo.dart';

class SignUpRepoImpl implements SignUpRepo {
  final ApiService apiService;

  SignUpRepoImpl(this.apiService);

  @override
  Future<Either<Failures, SignUpResponseBody>> signUp(
      {required SignUpRequestBody signUpRequestBody}) async {
    try {
      var response = await apiService.signUp(
          endPoint: 'auth/register', signUpRequestBody: signUpRequestBody);
      return Right(SignUpResponseBody.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
