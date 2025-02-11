import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_tasky/core/utils/assets.dart';
import 'package:todo_tasky/features/home/presentation/manager/home_cubit.dart';
import 'pick_task_image_bottom_sheet.dart';

class PickImageContainer extends StatelessWidget {
  const PickImageContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is ImagePickedSuccess) {
          return TextButton(
            onPressed: () {
              pickTaskImageBottomSheet(context);
            },
            child: Container(
              height: 100.h,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: FileImage(
                    File(
                      state.imagePicked.path,
                    ),
                  ),
                ),
              ),
            ),
          );
        }
        return TextButton(
          style: ButtonStyle(
            overlayColor: WidgetStateProperty.all(Colors.transparent),
            padding: WidgetStateProperty.all(EdgeInsets.zero),
          ),
          onPressed: () {
            pickTaskImageBottomSheet(context);
          },
          child: Container(
            height: 70.h,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  AssetsData.createTaskContainer,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
