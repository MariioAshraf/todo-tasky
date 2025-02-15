import 'package:dartz/dartz.dart';
import 'package:todo_tasky/features/home/data/models/create_task_input_body.dart';
import '../../../../core/failures/failures.dart';
import '../models/edit_task_input_body_model.dart';
import '../models/task_model.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<TaskModel>>> getTasks(int page);

  Future<Either<Failures, TaskModel>> editTask(
      String taskId, EditTaskInputBodyModel editTaskInputBodyModel);

  Future<Either<Failures, void>> createTask(CreateTaskInputBodyModel task);

  Future<Either<Failures, TaskModel>> getTask(String taskId);
}
