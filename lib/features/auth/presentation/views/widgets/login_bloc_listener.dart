import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_tasky/core/widgets/build_dialogs.dart';
import 'package:todo_tasky/core/utils/extensions.dart';
import '../../../../../core/routing/routes.dart';
import '../../manager/login_cubit/login_cubit.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      child: const SizedBox.shrink(),
      listener: (context, state) {
        if (state is LoginFailure) {
          context.pop();
          buildFailureDialog(context, state.errMsg);
        }
        if (state is LoginSuccess) {
          context.pop();
          context.pushNamed(Routes.homeView);
        }
        if (state is LoginLoading) {
          buildLoadingDialog(context);
        }
      },
    );
  }
}
