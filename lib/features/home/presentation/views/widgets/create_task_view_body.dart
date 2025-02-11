import 'package:flutter/material.dart';
import 'package:todo_tasky/core/utils/spacing.dart';
import 'package:todo_tasky/core/widgets/app_text_form_field.dart';
import 'package:todo_tasky/features/home/presentation/views/widgets/add_task_button.dart';
import 'package:todo_tasky/features/home/presentation/views/widgets/drop_down_priority.dart';
import 'package:todo_tasky/features/home/presentation/views/widgets/due_date_picker.dart';
import 'package:todo_tasky/features/home/presentation/views/widgets/pick_image_container.dart';
import '../../manager/home_cubit.dart';
import 'create_task_bloc_listener.dart';

class CreateTaskViewBody extends StatelessWidget {
  const CreateTaskViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final homeCubit = HomeCubit.get(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          verticalSpacing(27),
          PickImageContainer(),
          verticalSpacing(20),
          AppTextFormField(
            controller: homeCubit.titleController,
            hintText: 'Enter Task Title',
          ),
          verticalSpacing(20),
          AppTextFormField(
            controller: homeCubit.descController,
            hintText: 'Enter Task Description',
            maxLines: 5,
          ),
          verticalSpacing(20),
          PriorityDropdown(),
          verticalSpacing(20),
          DueDatePicker(),
          verticalSpacing(20),
          AddTaskButton(),
          CreateTaskBlocListener(),
        ],
      ),
    );
  }
}
