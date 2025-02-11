part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

// for get tasks
final class GetTasksLoading extends HomeState {}

final class PaginationLoading extends HomeState {}

final class GetTasksFailure extends HomeState {
  final String errMsg;

  GetTasksFailure(this.errMsg);
}

final class PaginationFailure extends HomeState {
  final String errMsg;

  PaginationFailure(this.errMsg);
}

final class GetTasksSuccess extends HomeState {
  final List<TaskModel> tasks;

  GetTasksSuccess(this.tasks);
}

// for create task
final class CreateTaskSuccess extends HomeState {}

final class CreateTaskFailure extends HomeState {
  final String errMsg;

  CreateTaskFailure(this.errMsg);
}

final class CreateTaskLoading extends HomeState {}

// for edit task
final class EditTaskLoading extends HomeState {}

final class EditTaskFailure extends HomeState {
  final String errMsg;

  EditTaskFailure(this.errMsg);
}

final class EditTaskSuccess extends HomeState {
  final TaskModel task;

  EditTaskSuccess({required this.task});
}

// for pick image
final class ImagePickedSuccess extends HomeState {
  final XFile imagePicked;

  ImagePickedSuccess(this.imagePicked);
}

final class ImagePickedFailure extends HomeState {
  final String errMsg;

  ImagePickedFailure(this.errMsg);
}

final class NoMoreTasks extends HomeState {}

final class GetTaskSuccess extends HomeState {}

final class GetTaskFailure extends HomeState {
  final String errMsg;

  GetTaskFailure(this.errMsg);
}

final class GetTaskLoading extends HomeState {}
