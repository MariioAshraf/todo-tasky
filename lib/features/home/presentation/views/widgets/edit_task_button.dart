import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_tasky/core/theming/app_colors.dart';
import 'package:todo_tasky/features/home/presentation/manager/home_cubit.dart';

class EditTaskButton extends StatelessWidget {
  const EditTaskButton({
    super.key,
    required this.taskId,
    required this.userId,
  });

  final String taskId;
  final String userId;

  @override
  Widget build(BuildContext context) {
    final homeCubit = HomeCubit.get(context);
    return SizedBox(
      height: 50.h,
      width: double.infinity,
      child: TextButton(
        style: ButtonStyle(
          padding: WidgetStateProperty.all(EdgeInsets.zero),
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          backgroundColor: WidgetStateProperty.all(AppColorsManager.mainPurple),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        onPressed: () {
          homeCubit.editTask(
            taskId: taskId,
            imagePath: homeCubit.taskImage!.path,
            userId: userId,
          );
        },
        child: const Text(
          'Edit Task',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
