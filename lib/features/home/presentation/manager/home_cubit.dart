import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_tasky/features/home/data/repos/home_repo.dart';
import '../../data/models/create_task_input_body.dart';
import '../../data/models/edit_task_input_body_model.dart';
import '../../data/models/task_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());
  final HomeRepo homeRepo;

  static HomeCubit get(context) => BlocProvider.of(context);
  final descController = TextEditingController();
  final titleController = TextEditingController();
  final priorityController = TextEditingController();
  final dueDateController = TextEditingController();
  final statusController = TextEditingController();

  Future<void> getTasks(int page) async {
    page == 1 ? emit(GetTasksLoading()) : emit(PaginationLoading());

    var result = await homeRepo.getTasks(page);

    result.fold((l) {
      page == 1
          ? emit(GetTasksFailure(l.errMsg))
          : emit(PaginationFailure(l.errMsg));
    }, (r) {
      r.isEmpty ? emit(NoMoreTasks()) : emit(GetTasksSuccess(r));
    });
  }

  Future<void> createTask() async {
    final CreateTaskInputBodyModel task = CreateTaskInputBodyModel(
      image: taskImage!.path,
      desc: descController.text,
      dueDate: dueDateController.text,
      priority: priorityController.text,
      title: titleController.text,
    );
    emit(CreateTaskLoading());
    var result = await homeRepo.createTask(task);
    result.fold((l) => emit(CreateTaskFailure(l.errMsg)),
        (r) => emit(CreateTaskSuccess()));
  }

  Future<void> editTask({
    required String imagePath,
    required String userId,
    required String taskId,
  }) async {
    final EditTaskInputBodyModel task = EditTaskInputBodyModel(
      image: imagePath,
      desc: descController.text,
      status: statusController.text,
      priority: priorityController.text,
      title: titleController.text,
      userId: userId,
    );
    emit(EditTaskLoading());
    var result = await homeRepo.editTask(taskId, task);
    result.fold((l) => emit(EditTaskFailure(l.errMsg)), (r) {
      emit(EditTaskSuccess(task: r));
    });
  }

  // Future<void> getTask(String taskId) async {
  //   emit(GetTaskLoading());
  //   var result = await homeRepo.getTask(taskId);
  //   result.fold(
  //       (l) => emit(GetTaskFailure(l.errMsg)), (r) => emit(GetTaskSuccess()));
  // }

  File? taskImage;

  Future<void> pickTaskImage(ImageSource source) async {
    try {
      final ImagePicker picker = ImagePicker();

      final XFile? imagePicked = await picker.pickImage(source: source);

      if (imagePicked != null) {
        taskImage = File(imagePicked.path);
        emit(ImagePickedSuccess(imagePicked));
      } else {
        emit(ImagePickedFailure('No media files were selected.'));
      }
    } catch (e) {
      emit(ImagePickedFailure(
          'An error ImagePickedFailure while picking media files.'));
    }
  }
}
