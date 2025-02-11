import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/app_colors.dart';
import '../theming/app_styles.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required this.hintText,
    this.hintStyle,
    this.inputTextStyle,
    this.suffixIcon,
    this.obscureText,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.backGroundColor,
    this.courserColor,
    this.controller,
    this.validator,
    this.onChanged,
    this.textInputType,
    this.maxLines,
    this.prefixIcon,
  });

  final String hintText;
  final void Function(String?)? onChanged;
  final TextEditingController? controller;
  final TextStyle? hintStyle;
  final Color? backGroundColor;
  final Color? courserColor;
  final TextStyle? inputTextStyle;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obscureText;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final Function(String?)? validator;
  final TextInputType? textInputType;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      keyboardType: textInputType,
      onChanged: onChanged,
      validator: (value) {
        if (validator == null) {
          return null;
        }
        return validator!(value);
      },
      controller: controller,
      cursorOpacityAnimates: true,
      cursorColor: courserColor ?? AppColorsManager.mainPurple,
      obscureText: obscureText ?? false,
      style: inputTextStyle ?? AppTextStyles.font14DarkBlueMedium,
      decoration: InputDecoration(
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.3,
            ),
            borderRadius: BorderRadius.circular(16)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.3,
            ),
            borderRadius: BorderRadius.circular(16)),
        filled: true,
        fillColor: backGroundColor ?? AppColorsManager.moreLighterGrey,
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 18.h,
            ),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColorsManager.mainPurple,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(16)),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColorsManager.lightGrey,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(16)),
        hintStyle: hintStyle ?? AppTextStyles.font14LightGreyRegular,
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
    );
  }
}
