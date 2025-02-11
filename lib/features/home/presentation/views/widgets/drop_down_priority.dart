import 'package:flutter/material.dart';
import 'package:todo_tasky/core/theming/app_colors.dart';
import 'package:todo_tasky/core/utils/spacing.dart';
import 'package:todo_tasky/features/home/presentation/manager/home_cubit.dart';

class PriorityDropdown extends StatefulWidget {
  const PriorityDropdown({
    super.key,
  });

  @override
  PriorityDropdownState createState() => PriorityDropdownState();
}

class PriorityDropdownState extends State<PriorityDropdown> {
  String selectedPriority = "medium";
  late TextEditingController priorityController;
  final Map<String, Color> priorityColors = {
    "low": Color(0xFF0087FF),
    "medium": AppColorsManager.mainPurple,
    "high": Color(0xFFFF7D53),
  };

  @override
  void initState() {
    priorityController = HomeCubit.get(context).priorityController;
    priorityController.text = selectedPriority;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Priority",
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
            fontWeight: FontWeight.w400,
          ),
        ),
        verticalSpacing(10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: _getPriorityColor(selectedPriority).withAlpha(300),
            borderRadius: BorderRadius.circular(12),
          ),
          child: DropdownButton<String>(
            value: selectedPriority,
            isExpanded: true,
            underline: const SizedBox.shrink(),
            icon: Icon(
              Icons.arrow_drop_down,
              color: _getPriorityColor(selectedPriority),
            ),
            onChanged: (String? newValue) {
              setState(() {
                selectedPriority = newValue!;
                priorityController.text = newValue;
              });
            },
            items: priorityColors.keys
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Row(
                  children: [
                    Icon(
                      Icons.flag_outlined,
                      color: priorityColors[value],
                    ),
                    const SizedBox(width: 8),
                    Text(
                      value,
                      style: TextStyle(
                        fontSize: 16,
                        color: priorityColors[value],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
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
