import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_tasky/core/di/dependency_injection.dart';
import 'package:todo_tasky/features/auth/data/repos/sign_up_repos/sign_up_repo_impl.dart';
import 'package:todo_tasky/features/auth/presentation/views/widgets/sign_up_view_body.dart';
import '../manager/sign_up_cubit/sign_up_cubit.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (context) => SignUpCubit(gitIt.get<SignUpRepoImpl>()),
      child: const SafeArea(child: SignUpViewBody()),
    ));
  }
}
