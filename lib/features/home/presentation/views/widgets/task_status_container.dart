import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_tasky/core/theming/app_colors.dart';

class TaskStatusContainer extends StatelessWidget {
  const TaskStatusContainer({
    super.key,
    required this.status,
  });

  final String status;

  @override
  Widget build(BuildContext context) {
    if (status == 'inProgress') {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          color: AppColorsManager.lightPurple,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 6.w,
          vertical: 3.h,
        ),
        child: Text(
          'InProgress',
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: AppColorsManager.mainPurple,
          ),
        ),
      );
    }
    if (status == 'finished') {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          color: Color(0xFFE0F2FF),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 6.w,
          vertical: 3.h,
        ),
        child: Text(
          'Finished',
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: Color(0xFF0087FF),
          ),
        ),
      );
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        color: Color(0xFFFFE4F2),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 6.w,
        vertical: 3.h,
      ),
      child: Text(
        'Waiting',
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: Color(0xFFFF7D53),
        ),
      ),
    );
  }
}
