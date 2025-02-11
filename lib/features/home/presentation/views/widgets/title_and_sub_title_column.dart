import 'package:flutter/material.dart';
import 'package:todo_tasky/core/utils/spacing.dart';
import '../../../../../core/theming/app_styles.dart';

class TitleAndSubTitleColumn extends StatelessWidget {
  const TitleAndSubTitleColumn(
      {super.key, required this.title, required this.desc});

  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.font18DarkBlueMedium,
        ),
        verticalSpacing(10),
        Text(
          textAlign: TextAlign.left,
          desc,
          style: AppTextStyles.font14GreyRegular,
        )
      ],
    );
  }
}
