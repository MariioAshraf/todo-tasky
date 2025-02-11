import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_tasky/core/utils/extensions.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../../../../core/theming/app_styles.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../manager/sign_up_cubit/sign_up_cubit.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      child: const SizedBox.shrink(),
      listener: (context, state) {
        if (state is SignUpLoading) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: AppColorsManager.mainPurple,
              ),
            ),
          );
        }
        if (state is SignUpFailure) {
          context.pop();
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              icon: const Icon(
                Icons.error,
                color: Colors.red,
                size: 32,
              ),
              content: Text(state.errMsg),
              actions: [
                TextButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: Text(
                      'Got it',
                      style: AppTextStyles.font14DarkBlueMedium,
                    ))
              ],
            ),
          );
        }
        if (state is SignUpSuccess) {
          _showSuccessMessage(context);
          context.pushReplacementNamed(Routes.loginView);
        }
      },
    );
  }
}

void _showSuccessMessage(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        'Account created successfully',
        style: AppTextStyles.font14DarkBlueMedium,
      ),
      backgroundColor: Colors.green,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(16),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
        label: 'Ok',
        textColor: AppColorsManager.mainPurple,
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    ),
  );
}
