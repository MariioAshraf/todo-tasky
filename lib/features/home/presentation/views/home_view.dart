import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_tasky/core/di/dependency_injection.dart';
import 'package:todo_tasky/core/utils/extensions.dart';
import 'package:todo_tasky/features/home/data/repos/home_repo_impl.dart';
import 'package:todo_tasky/features/home/presentation/manager/home_cubit.dart';
import 'package:todo_tasky/features/home/presentation/views/widgets/home_view_body.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/utils/spacing.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _buildFloatingButton(),
      backgroundColor: Colors.white,
      body: HomeViewBody(),
    );
  }

  Widget _buildFloatingButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CircleAvatar(
          radius: 25.r,
          backgroundColor: AppColorsManager.lightPurple,
          child: IconButton(
            color: AppColorsManager.mainPurple,
            onPressed: () {
              context.pushNamed(Routes.qrScanner);
            },
            icon: Icon(
              Icons.qr_code_2,
            ),
          ),
        ),
        verticalSpacing(10.h),
        CircleAvatar(
          backgroundColor: AppColorsManager.mainPurple,
          radius: 35.r,
          child: FloatingActionButton(
            elevation: 0,
            backgroundColor: AppColorsManager.mainPurple,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.r),
            ),
            onPressed: () {
              context.pushNamed(Routes.createTaskView);
            },
            child: Icon(
              size: 32,
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
