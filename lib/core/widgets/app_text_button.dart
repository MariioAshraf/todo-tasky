import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/app_colors.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton(
      {super.key,
      this.onPressed,
      this.borderRadius,
      required this.childWidget,
      this.buttonWidth,
      this.buttonHeight,
      this.horizontalPadding,
      this.verticalPadding,
      this.backGroundColor});

  final BorderRadiusGeometry? borderRadius;
  final VoidCallback? onPressed;
  final Widget childWidget;
  final double? buttonWidth;
  final double? buttonHeight;
  final double? horizontalPadding;
  final double? verticalPadding;

  final Color? backGroundColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(16),
          ),
        ),
        fixedSize: WidgetStateProperty.all(
          Size(
            buttonWidth?.w ?? double.maxFinite,
            buttonHeight ?? 50.h,
          ),
        ),
        padding: WidgetStateProperty.all(
          EdgeInsets.symmetric(
            horizontal: horizontalPadding?.w ?? 12.w,
            vertical: verticalPadding?.h ?? 14.h,
          ),
        ),
        backgroundColor: WidgetStateProperty.all(
          backGroundColor ?? AppColorsManager.mainPurple,
        ),
      ),
      onPressed: onPressed,
      child: childWidget,
    );
  }
}
