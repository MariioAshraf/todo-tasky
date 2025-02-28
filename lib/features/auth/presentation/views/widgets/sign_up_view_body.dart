import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_tasky/features/auth/presentation/views/widgets/sign_up_bloc_listener.dart';
import 'package:todo_tasky/features/auth/presentation/views/widgets/sign_up_form.dart';
import 'package:todo_tasky/features/auth/presentation/views/widgets/terms_and_conditions_text.dart';
import '../../../../../../core/theming/app_styles.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../../../../../core/widgets/app_text_button.dart';
import '../../manager/sign_up_cubit/sign_up_cubit.dart';
import 'already_have_an_account_text.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var signUpCubit = SignUpCubit.get(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 40.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sign Up Now',
              style: AppTextStyles.font24BlueBold,
            ),
            verticalSpacing(8),
            Text(
              'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
              style: AppTextStyles.font14GreyRegular,
            ),
            verticalSpacing(30),
            const SignUpForm(),
            verticalSpacing(22),
            const SignUpBlocListener(),
            BlocBuilder<SignUpCubit, SignUpState>(
              builder: (context, state) {
                return AppTextButton(
                  onPressed: () async {
                    if (signUpCubit.formKey.currentState!.validate()) {
                      await signUpCubit.signUp();
                    }
                  },
                  childWidget: Text(
                    'Sign Up',
                    style: AppTextStyles.font16WhiteSemiBold,
                  ),
                );
              },
            ),
            verticalSpacing(40),
            const TermsAndConditionsText(),
            verticalSpacing(50),
            const AlreadyHaveAnAccountAndSignInText(),
          ],
        ),
      ),
    );
  }
}
