import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/utils/assets.dart';
import 'package:intl/intl.dart';
import '../../manager/home_cubit.dart';

class EndDateContainer extends StatefulWidget {
  const EndDateContainer({
    super.key,
    required this.status,
    required this.date,
  });

  final String status;
  final String date;

  @override
  State<EndDateContainer> createState() => _EndDateContainerState();
}

class _EndDateContainerState extends State<EndDateContainer> {
  late TextEditingController _dueDateController;

  @override
  void initState() {
    _dueDateController = HomeCubit.get(context).dueDateController;
    _dueDateController.text = widget.date;
    super.initState();
  }

  Future<void> _pickDueDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Default date
      firstDate: DateTime.now(), // The earliest date
      lastDate: DateTime(2100), // The latest date
    );

    if (picked != null && picked != DateTime.parse(widget.date)) {
      setState(() {
        _dueDateController.text = '$picked';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        overlayColor: WidgetStateProperty.all(Colors.transparent),
      ),
      onPressed: () {
        _pickDueDate(context);
      },
      child: Container(
        width: double.infinity,
        height: 70.h,
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 12.h,
        ),
        decoration: BoxDecoration(
          color: AppColorsManager.mainPurple.withAlpha(300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'End Date',
                    style: AppTextStyles.font13GreyRegular,
                  ),
                  Text(
                    _formatDate(_dueDateController.text),
                    style: AppTextStyles.font14BlackRegular,
                  ),
                ],
              ),
            ),
            Image.asset(AssetsData.calenderIcon),
          ],
        ),
      ),
    );
  }
}

String _formatDate(String isoDate) {
  DateTime dateTime = DateTime.parse(isoDate);

  String formattedDate = DateFormat('d MMMM, yyyy').format(dateTime);

  return formattedDate;
}

Color getPriorityColor(String priorityAndStatus) {
  if (priorityAndStatus == "low" || priorityAndStatus == "finished") {
    return Color(0xFF0087FF);
  } else if (priorityAndStatus == "medium" ||
      priorityAndStatus == "inProgress") {
    return AppColorsManager.mainPurple;
  } else {
    return Color(0xFFFF7D53);
  }
}
