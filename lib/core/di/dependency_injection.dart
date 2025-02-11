import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_tasky/core/networking/api_service.dart';
import 'package:todo_tasky/features/auth/data/repos/login_repos/login_repo_impl.dart';
import 'package:todo_tasky/features/auth/data/repos/sign_up_repos/sign_up_repo_impl.dart';
import 'package:todo_tasky/features/home/data/repos/home_repo_impl.dart';

import '../networking/dio_factory.dart';

final gitIt = GetIt.instance;

void setupServiceLocator() {
  Dio dio = DioFactory.getDio();
  gitIt.registerSingleton<ApiService>(ApiService(dio));
  gitIt
      .registerSingleton<LoginRepoImpl>(LoginRepoImpl(gitIt.get<ApiService>()));

  gitIt.registerSingleton<SignUpRepoImpl>(
      SignUpRepoImpl(gitIt.get<ApiService>()));

  gitIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(gitIt.get<ApiService>()));
}
