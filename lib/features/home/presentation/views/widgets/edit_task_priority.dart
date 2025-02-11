import 'package:flutter/material.dart';
import 'package:todo_tasky/core/theming/app_colors.dart';
import 'package:todo_tasky/core/utils/spacing.dart';
import 'package:todo_tasky/features/home/presentation/manager/home_cubit.dart';

class EditTaskPriority extends StatefulWidget {
  const EditTaskPriority({
    super.key,
    required this.priority,
  });

  final String priority;

  @override
  EditTaskPriorityState createState() => EditTaskPriorityState();
}

class EditTaskPriorityState extends State<EditTaskPriority> {
  late TextEditingController _priorityController;
  final Map<String, Color> priorityColors = {
    "low": Color(0xFF0087FF),
    "medium": AppColorsManager.mainPurple,
    "high": Color(0xFFFF7D53),
  };

  @override
  void initState() {
    _priorityController = HomeCubit.get(context).priorityController;
    _priorityController.text = widget.priority;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: _getPriorityColor(_priorityController.text).withAlpha(300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButton<String>(
        value: _priorityController.text,
        isExpanded: true,
        underline: const SizedBox.shrink(),
        icon: Icon(
          Icons.arrow_drop_down,
          color: _getPriorityColor(_priorityController.text),
        ),
        onChanged: (String? newValue) {
          setState(() {
            _priorityController.text = newValue!;
            print(HomeCubit.get(context).priorityController.text);
          });
        },
        items:
            priorityColors.keys.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Row(
              children: [
                Icon(
                  Icons.flag_outlined,
                  size: 32,
                  color: priorityColors[value],
                ),
                Text(
                  '${value[0].toUpperCase()}${value.substring(1)} Priority',
                  style: TextStyle(
                    fontSize: 18,
                    color: priorityColors[value],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
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
