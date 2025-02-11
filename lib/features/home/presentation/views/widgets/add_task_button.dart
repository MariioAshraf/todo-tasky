import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_tasky/core/theming/app_colors.dart';
import 'package:todo_tasky/features/home/presentation/manager/home_cubit.dart';
import '../../../../../core/widgets/show_snack_bar.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final HomeCubit homeCubit = HomeCubit.get(context);
    return SizedBox(
      width: double.infinity,
      height: 60.h,
      child: TextButton(
          style: ButtonStyle(
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.r),
              ),
            ),
            backgroundColor:
                WidgetStateProperty.all(AppColorsManager.mainPurple),
          ),
          onPressed: () {
            if (_canAddTask(homeCubit)) {
              homeCubit.createTask();
            } else {
              showSnackBar(context, 'Please fill all the fields');
            }
          },
          child: Text(
            'Add Task',
            style: TextStyle(
              color: Colors.white,
            ),
          )),
    );
  }
}

bool _canAddTask(HomeCubit homeCubit) {
  if (homeCubit.taskImage != null &&
      homeCubit.descController.text.isNotEmpty &&
      homeCubit.dueDateController.text.isNotEmpty &&
      homeCubit.priorityController.text.isNotEmpty &&
      homeCubit.titleController.text.isNotEmpty) {
    return true;
  }
  return false;
}
