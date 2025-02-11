import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_tasky/core/utils/extensions.dart';
import 'package:todo_tasky/core/utils/spacing.dart';
import 'package:todo_tasky/core/widgets/build_dialogs.dart';
import 'package:todo_tasky/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:todo_tasky/features/home/presentation/views/widgets/edit_task_priority.dart';
import 'package:todo_tasky/features/home/presentation/views/widgets/title_and_sub_title_column.dart';
import '../../../data/models/task_model.dart';
import '../../manager/home_cubit.dart';
import 'edit_task_bloc_listener.dart';
import 'edit_task_button.dart';
import 'edit_task_image.dart';
import 'edit_task_status_container.dart';
import 'end_date_container.dart';

class TaskDetailsViewBody extends StatefulWidget {
  const TaskDetailsViewBody({super.key, required this.task});

  final TaskModel task;

  @override
  State<TaskDetailsViewBody> createState() => _TaskDetailsViewBodyState();
}

class _TaskDetailsViewBodyState extends State<TaskDetailsViewBody> {
  late HomeCubit homeCubit;

  @override
  void initState() {
    homeCubit = HomeCubit.get(context);
    _controllersInitialization();
    super.initState();
  }

  void _controllersInitialization() {
    homeCubit.priorityController.text = widget.task.priority;
    homeCubit.statusController.text = widget.task.status;
    homeCubit.descController.text = widget.task.desc;
    homeCubit.titleController.text = widget.task.title;
    homeCubit.dueDateController.text = widget.task.updatedAt;
    homeCubit.taskImage = File(widget.task.image);
  }

  @override
  Widget build(BuildContext context) {
    final String userId = LoginCubit.get(context).userId;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EditTaskBlocListener(
              taskId: widget.task.id,
            ),
            EditTaskImage(image: widget.task.image),
            verticalSpacing(10),
            TitleAndSubTitleColumn(
              title: widget.task.title,
              desc: widget.task.desc,
            ),
            verticalSpacing(20),
            EndDateContainer(
              date: widget.task.updatedAt,
              status: widget.task.status,
            ),
            verticalSpacing(20),
            EditTaskStatusContainer(
              status: widget.task.status,
            ),
            verticalSpacing(20),
            EditTaskPriority(
              priority: widget.task.priority,
            ),
            verticalSpacing(20),
            EditTaskButton(
              taskId: widget.task.id,
              userId: userId,
            ),
          ],
        ),
      ),
    );
  }
}
