import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_tasky/features/auth/data/models/sign_up_models/sign_up_request_body.dart';
import 'package:todo_tasky/features/auth/data/repos/sign_up_repos/sign_up_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.signUpRepo) : super(SignupInitial());
  final SignUpRepo signUpRepo;
  final GlobalKey<FormState> formKey = GlobalKey();

  static SignUpCubit get(context) => BlocProvider.of(context);

  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final displayNameController = TextEditingController();
  final experienceYearsController = TextEditingController();
  final addressController = TextEditingController();
  final levelController = TextEditingController();

  Future<void> signUp() async {
    final SignUpRequestBody signUpRequestBody = SignUpRequestBody(
      address: addressController.text,
      displayName: displayNameController.text,
      experienceYears: experienceYearsController.text,
      level: levelController.text,
      password: passwordController.text,
      phone: phoneController.text,
    );
    emit(SignUpLoading());
    final result =
        await signUpRepo.signUp(signUpRequestBody: signUpRequestBody);
    result.fold(
        (l) => emit(SignUpFailure(l.errMsg)), (r) => emit(SignUpSuccess()));
  }
}
