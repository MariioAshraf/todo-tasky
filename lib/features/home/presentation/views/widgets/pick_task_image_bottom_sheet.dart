import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_tasky/core/theming/app_colors.dart';
import 'package:todo_tasky/core/utils/extensions.dart';
import 'package:todo_tasky/features/home/presentation/manager/home_cubit.dart';

pickTaskImageBottomSheet(BuildContext context) {
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20.r),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 80.w),
        height: 200.h,
        width: double.infinity,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  context.pop();
                  HomeCubit.get(context).pickTaskImage(ImageSource.gallery);
                },
                icon: Icon(
                  Icons.add_photo_alternate_outlined,
                  size: 50,
                  color: AppColorsManager.mainPurple,
                ),
              ),
              IconButton(
                onPressed: () {
                  context.pop();
                  HomeCubit.get(context).pickTaskImage(ImageSource.camera);
                },
                icon: Icon(
                  Icons.add_a_photo_outlined,
                  size: 50,
                  color: AppColorsManager.mainPurple,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
