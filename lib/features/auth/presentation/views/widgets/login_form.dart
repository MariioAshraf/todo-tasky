import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../../../../../core/widgets/app_text_form_field.dart';
import '../../../../home/presentation/views/widgets/phone_input_widget.dart';
import '../../manager/login_cubit/login_cubit.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isObscureText = true;

  late TextEditingController passwordController;

  @override
  void initState() {
    passwordController = context.read<LoginCubit>().passwordController;
    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var loginCubit = LoginCubit.get(context);
    return Form(
      key: loginCubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PhoneInputWidget(
            phoneController: loginCubit.phoneController,
            validator: (p0) {
              if (p0 == null || p0.toString().isEmpty) {
                return 'Please enter your phone number';
              }
              return null;
            },
          ),

          verticalSpacing(10),
          AppTextFormField(
            controller: loginCubit.passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
            hintText: 'Password',
          ),
          verticalSpacing(20),
        ],
      ),
    );
  }
}
