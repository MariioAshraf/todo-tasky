import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_tasky/features/auth/presentation/views/widgets/terms_and_conditions_text.dart';
import '../../../../../../core/theming/app_styles.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../../../../../core/widgets/app_text_button.dart';
import '../../manager/login_cubit/login_cubit.dart';
import 'don\'t_have_account_text.dart';
import 'login_bloc_listener.dart';
import 'login_form.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var loginCubit = LoginCubit.get(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 40.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Back',
              style: AppTextStyles.font24BlueBold,
            ),
            verticalSpacing(8),
            Text(
              'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
              style: AppTextStyles.font14GreyRegular,
            ),
            verticalSpacing(30),
            const LoginForm(),
            verticalSpacing(22),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Forgot Password?',
                style: AppTextStyles.font13BlueRegular,
              ),
            ),
            verticalSpacing(22),
            const LoginBlocListener(),
            AppTextButton(
              onPressed: () async {
                if (loginCubit.formKey.currentState!.validate()) {
                  await loginCubit.login();
                }
              },
              childWidget: Text(
                'Login',
                style: AppTextStyles.font16WhiteSemiBold,
              ),
            ),
            verticalSpacing(40),
            const TermsAndConditionsText(),
            verticalSpacing(50),
            const DoNotHaveAnAccountAndSignUpText(),
          ],
        ),
      ),
    );
  }
}

