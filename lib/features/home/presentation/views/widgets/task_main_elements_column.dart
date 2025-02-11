import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_tasky/core/utils/spacing.dart';
import 'package:todo_tasky/features/home/data/models/task_model.dart';
import 'package:todo_tasky/features/home/presentation/views/widgets/priority_and_date_row.dart';
import 'package:todo_tasky/features/home/presentation/views/widgets/task_status_container.dart';

class TaskMainElementsColumn extends StatelessWidget {
  const TaskMainElementsColumn({
    super.key,
    required this.task,
  });

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  task.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              horizontalSpacing(8.w),
              TaskStatusContainer(
                status: task.status,
              ),
            ],
          ),
          verticalSpacing(6.h),
          // Task Description
          Text(
            task.desc,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          verticalSpacing(8.h),
           PriorityAndDateRow(
             priority: task.priority,
             dueDate: task.createdAt,
           ),
        ],
      ),
    );
  }
}
