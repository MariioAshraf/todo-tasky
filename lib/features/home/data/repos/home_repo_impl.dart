import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:todo_tasky/core/failures/failures.dart';
import 'package:todo_tasky/core/networking/api_service.dart';
import 'package:todo_tasky/features/home/data/models/create_task_input_body.dart';
import 'package:todo_tasky/features/home/data/models/edit_task_input_body_model.dart';
import '../models/task_model.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failures, void>> createTask(
      CreateTaskInputBodyModel task) async {
    try {
      await apiService.createTask(
          endPoint: 'todos', createTaskInputBodyModel: task);
      return Right(null);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<TaskModel>>> getTasks(int page) async {
    try {
      var response = await apiService.getTasks(
        endPoint: 'todos',
        queryParameters: {'page': page},
      );

      return Right(response.map((e) => TaskModel.fromJson(e)).toList());
    } catch (e) {
      if (e is DioException) {
        Left(ServerFailure.fromDioException(e));
      }

      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, TaskModel>> editTask(
      String taskId, EditTaskInputBodyModel editTaskInputBodyModel) async {
    try {
      var response = await apiService.editTask(
        endPoint: 'todos/$taskId',
        editTaskInputBodyModel: editTaskInputBodyModel,
      );
      return Right(TaskModel.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, void>> getTask(String taskId) async {
    try {
      await apiService.getTask(endPoint: 'todos/$taskId', taskId: taskId);
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
