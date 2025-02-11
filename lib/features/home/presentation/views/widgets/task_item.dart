import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_tasky/core/utils/spacing.dart';
import 'package:todo_tasky/features/home/data/models/task_model.dart';
import 'package:todo_tasky/features/home/presentation/views/widgets/task_main_elements_column.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key, required this.task});

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLocalImage(task.image),
          horizontalSpacing(12.w),
          // Task Details
          TaskMainElementsColumn(
            task: task,
          ),
          horizontalSpacing(8.w),
          // More Options Button
          SizedBox(
            width: 36.w,
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: Icon(Icons.more_vert),
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildLocalImage(String imagePath) {
  try {
    if (File(imagePath).existsSync()) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: AspectRatio(
          aspectRatio: 2.7 / 3.8,
          child: Image.file(
            File(
              imagePath,
            ),
            fit: BoxFit.cover,
          ),
        ),
      );
    } else {
      return const Icon(
        Icons.broken_image,
        color: Colors.grey,
      );
    }
  } catch (e) {
    return const Icon(
      Icons.error,
      color: Colors.red,
    );
  }
}
