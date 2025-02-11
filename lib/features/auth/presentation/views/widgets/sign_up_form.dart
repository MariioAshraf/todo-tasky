import 'package:flutter/material.dart';
import '../../../../../../core/utils/app_regex.dart';
import '../../../../../../core/theming/app_colors.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../../../../../core/widgets/app_text_form_field.dart';
import '../../../../home/presentation/views/widgets/phone_input_widget.dart';
import '../../manager/sign_up_cubit/sign_up_cubit.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool isObscureText = true;

  @override
  void initState() {
    super.initState();
  }

  bool isLevelCorrect = true;

  @override
  Widget build(BuildContext context) {
    var signUpCubit = SignUpCubit.get(context);
    return Form(
      key: signUpCubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'please enter your name';
              }
            },
            controller: signUpCubit.displayNameController,
            hintText: 'name',
          ),
          verticalSpacing(10),
          PhoneInputWidget(
            phoneController: signUpCubit.phoneController,
          ),
          verticalSpacing(10),
          AppTextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'please enter a valid email';
              }
            },
            controller: signUpCubit.passwordController,
            hintText: 'Password',
            obscureText: isObscureText,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              icon: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
                color: AppColorsManager.darkBlue,
              ),
            ),
          ),
          verticalSpacing(10),
          AppTextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'please enter an address';
              }
            },
            controller: signUpCubit.addressController,
            hintText: 'Address',
          ),
          verticalSpacing(10),
          AppTextFormField(
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isLevelValid(value)) {
                setState(() {
                  isLevelCorrect = false;
                });
                return 'please enter valid level';
              }
            },
            controller: signUpCubit.levelController,
            hintText: 'Experience Level',
          ),
          verticalSpacing(10),
          AppTextFormField(
            textInputType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'please enter a valid years count';
              }
            },
            controller: signUpCubit.experienceYearsController,
            hintText: 'Experience years',
          ),
          isLevelCorrect
              ? SizedBox.shrink()
              : Text(
                  style: TextStyle(color: Colors.red),
                  'Experience Level should be like :\n junior || senior || fresh || midLevel'),
          verticalSpacing(20),
        ],
      ),
    );
  }
}
