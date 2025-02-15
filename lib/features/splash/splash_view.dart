import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_tasky/core/theming/app_colors.dart';
import 'package:todo_tasky/core/utils/assets.dart';
import 'package:todo_tasky/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import '../../core/routing/routes.dart';
import '../../core/utils/shared_prefs_token_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _navigateBasedOnToken();
  }

  Future<void> _navigateBasedOnToken() async {
    final String? userId = await LoginCubit.get(context).getUserId();
    await Future.delayed(const Duration(seconds: 2));

    final accessToken = await TokenManager.getAccessToken();
    final refreshToken = await TokenManager.getRefreshToken();

    if (accessToken != null && refreshToken != null) {
      final isTokenValid = await TokenManager.refreshAccessToken();
      if (isTokenValid && userId != null) {
        if (mounted) {
          Navigator.pushReplacementNamed(context, Routes.homeView);
        }
        return;
      }
    }
    if (mounted) {
      Navigator.pushReplacementNamed(context, Routes.loginView);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsManager.mainPurple,
      body: Center(
        child: Image.asset(
          AssetsData.splashTaskyLogo,
          width: 150.w,
          height: 150.h,
        ),
      ),
    );
  }
}
