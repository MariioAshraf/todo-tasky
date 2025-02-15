import 'package:flutter/material.dart';
import 'package:todo_tasky/core/routing/routes.dart';
import 'package:todo_tasky/features/home/presentation/views/task_details_view.dart';
import 'package:todo_tasky/features/home/presentation/views/create_task_view.dart';
import 'package:todo_tasky/features/splash/splash_view.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/sign_up_view.dart';
import '../../features/home/data/models/task_model.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/home/presentation/views/qr_scanner_view.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginView:
        return MaterialPageRoute(
          builder: (_) => const LoginView(),
        );

      case Routes.homeView:
        return MaterialPageRoute(
          builder: (_) => HomeView(),
        );

      case Routes.taskDetailsView:
        return MaterialPageRoute(builder: (_) {
          final task = settings.arguments as TaskModel;
          return TaskDetailsView(task: task);
        });
      case Routes.signUpView:
        return MaterialPageRoute(
          builder: (_) => const SignUpView(),
        );
      case Routes.qrScanner:
        return MaterialPageRoute(
          builder: (_) => const QRScannerView(),
        );
      case Routes.splashView:
        return MaterialPageRoute(
          builder: (_) => const SplashView(),
        );
      case Routes.createTaskView:
        return MaterialPageRoute(
          builder: (_) => const CreateTaskView(),
        );
      default:
        return null;
    }
  }
}
