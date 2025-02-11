import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_tasky/core/theming/app_colors.dart';
import 'package:todo_tasky/core/utils/spacing.dart';

class PriorityAndDateRow extends StatelessWidget {
  const PriorityAndDateRow({
    super.key,
    required this.priority,
    required this.dueDate,
  });

  final String priority;
  final String dueDate;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                WidgetSpan(
                  child: Icon(
                    size: 22.sp,
                    Icons.outlined_flag,
                    color: _getPriorityColor(priority),
                  ),
                ),
                TextSpan(
                  text: '${priority[0].toUpperCase()}${priority.substring(1)}',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: _getPriorityColor(priority),
                  ),
                ),
              ],
            ),
          ),
        ),
        horizontalSpacing(8.w),
        Expanded(
          child: Text(
            textAlign: TextAlign.end,
            dueDate,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}

Color _getPriorityColor(String priority) {
  if (priority == "low") {
    return Color(0xFF0087FF);
  } else if (priority == "medium") {
    return AppColorsManager.mainPurple;
  } else {
    return Color(0xFFFF7D53);
  }
}
