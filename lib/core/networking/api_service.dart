import 'package:dio/dio.dart';
import 'package:todo_tasky/features/auth/data/models/login_models/login_request_body.dart';
import 'package:todo_tasky/features/auth/data/models/sign_up_models/sign_up_request_body.dart';
import 'package:todo_tasky/features/home/data/models/task_model.dart';

import '../../features/home/data/models/create_task_input_body.dart';
import '../../features/home/data/models/edit_task_input_body_model.dart';
import '../utils/shared_prefs_token_manager.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  final String _baseUrl = 'https://todo.iraqsapp.com/';

  /// Generic POST Request
  Future<Map<String, dynamic>> post({
    required String endPoint,
    required Map<String, dynamic> data,
    Map<String, String>? headers,
  }) async {
    final response = await _dio.post(
      '$_baseUrl$endPoint',
      data: data,
      options: Options(headers: headers),
    );
    return response.data;
  }

  /// Login API
  Future<Map<String, dynamic>> login({
    required String endPoint,
    required LoginRequestBody loginRequestBody,
  }) async {
    final response = await post(
      endPoint: endPoint,
      data: loginRequestBody.toJson(),
    );

    // Save tokens after login
    TokenManager.saveTokens(
      accessToken: response['access_token'],
      refreshToken: response['refresh_token'],
    );
    return response;
  }

  /// SignUp API
  Future<Map<String, dynamic>> signUp({
    required String endPoint,
    required SignUpRequestBody signUpRequestBody,
  }) async {
    return await post(
      endPoint: endPoint,
      data: signUpRequestBody.toJson(),
    );
  }

  /// Create Task API
  Future<Map<String, dynamic>> createTask({
    required String endPoint,
    required CreateTaskInputBodyModel createTaskInputBodyModel,
  }) async {
    var response = await post(
      data: createTaskInputBodyModel.toJson(),
      endPoint: endPoint,
    );
    return response;
  }

  /// Get Tasks API
  Future<List<Map<String, dynamic>>> getTasks({
    Map<String, dynamic>? queryParameters,
    required String endPoint,
  }) async {
    var response = await _dio.get(
      '$_baseUrl$endPoint',
      queryParameters: queryParameters,
    );
    return (response.data as List)
        .map((e) => e as Map<String, dynamic>)
        .toList();
  }

  /// Edit Task API

  Future<Map<String, dynamic>> editTask(
      {required String endPoint,
      required EditTaskInputBodyModel editTaskInputBodyModel}) async {
    var response = await _dio.put(
      '$_baseUrl$endPoint',
      data: editTaskInputBodyModel.toJson(),
    );
    return response.data;
  }

  Future<void> getTask(
      {required String endPoint, required String taskId}) async {
    await _dio.get(
      '$_baseUrl$endPoint',
    );
  }
}
