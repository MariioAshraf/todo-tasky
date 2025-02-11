import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_tasky/core/utils/assets.dart';
import 'package:todo_tasky/core/utils/spacing.dart';
import 'package:todo_tasky/features/home/presentation/manager/home_cubit.dart';

class DueDatePicker extends StatefulWidget {
  const DueDatePicker({
    super.key,
  });

  @override
  DueDatePickerState createState() => DueDatePickerState();
}

class DueDatePickerState extends State<DueDatePicker> {
  DateTime? _selectedDate;
  late TextEditingController _dueDateController;

  @override
  void initState() {
    _dueDateController = HomeCubit.get(context).dueDateController;
    super.initState();
  }

  Future<void> _pickDueDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Default date
      firstDate: DateTime.now(), // The earliest date
      lastDate: DateTime(2100), // The latest date
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _dueDateController.text =
            "${picked.day}/${picked.month}/${picked.year}";
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Due date",
          style: TextStyle(fontSize: 16, color: Colors.grey[700]),
        ),
        verticalSpacing(4),
        InkWell(
          onTap: () => _pickDueDate(context),
          child: Container(
            width: double.infinity,
            height: 55.h,
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 12.h,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey[400]!,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _selectedDate != null
                      ? "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}"
                      : "Choose due date...",
                  style: TextStyle(
                    fontSize: 16,
                    color: _selectedDate != null ? Colors.black : Colors.grey,
                  ),
                ),
                Image.asset(AssetsData.calenderIcon),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
