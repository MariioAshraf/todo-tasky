import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../manager/home_cubit.dart';
import 'end_date_container.dart';

class EditTaskStatusContainer extends StatefulWidget {
  const EditTaskStatusContainer({super.key, required this.status});

  final String status;

  @override
  State<EditTaskStatusContainer> createState() =>
      _EditTaskStatusContainerState();
}

class _EditTaskStatusContainerState extends State<EditTaskStatusContainer> {
  late TextEditingController _statusController;

  @override
  void initState() {
    _statusController = HomeCubit.get(context).statusController;
    _statusController.text = widget.status;
    super.initState();
  }

  final Map<String, Color> priorityColors = {
    "finished": Color(0xFF0087FF),
    "inProgress": AppColorsManager.mainPurple,
    "waiting": Color(0xFFFF7D53),
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70.h,
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 12.h,
      ),
      decoration: BoxDecoration(
        color: getPriorityColor(_statusController.text).withAlpha(300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton<String>(
        value: _statusController.text,
        isExpanded: true,
        underline: const SizedBox.shrink(),
        icon: Icon(
          Icons.arrow_drop_down,
          color: getPriorityColor(_statusController.text),
        ),
        onChanged: (String? newValue) {
          setState(() {
            _statusController.text = newValue!;
          });
        },
        items:
            priorityColors.keys.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value[0].toUpperCase() + value.substring(1),
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: getPriorityColor(value),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
