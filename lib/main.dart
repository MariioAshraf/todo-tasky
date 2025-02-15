import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/di/dependency_injection.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/utils/bloc_observer.dart';
import 'features/auth/data/repos/login_repos/login_repo_impl.dart';
import 'features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'features/home/data/repos/home_repo_impl.dart';
import 'features/home/presentation/manager/home_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => LoginCubit(gitIt.get<LoginRepoImpl>())),
          BlocProvider(
              create: (context) => HomeCubit(gitIt.get<HomeRepoImpl>()))
        ],
        child: MaterialApp(
          initialRoute: Routes.splashView,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRouter().generateRoute,
        ),
      ),
    );
  }
}
