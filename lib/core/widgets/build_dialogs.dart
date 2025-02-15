import 'package:flutter/material.dart';
import 'package:todo_tasky/core/utils/extensions.dart';
import '../theming/app_colors.dart';
import '../theming/app_styles.dart';

 buildFailureDialog(BuildContext context, String errMsg) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      icon: const Icon(
        Icons.error,
        color: Colors.red,
        size: 32,
      ),
      content: Text(errMsg),
      actions: [
        TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              'Got it',
              style: AppTextStyles.font14DarkBlueMedium,
            ))
      ],
    ),
  );
}

buildLoadingDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => const Center(
      child: CircularProgressIndicator(
        color: AppColorsManager.mainPurple,
      ),
    ),
  );
}
