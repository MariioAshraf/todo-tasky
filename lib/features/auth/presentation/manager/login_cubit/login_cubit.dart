import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/models/login_models/login_request_body.dart';
import '../../../data/repos/login_repos/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());

  late String userId;

  static LoginCubit get(context) => BlocProvider.of(context);
  final LoginRepo loginRepo;
  final GlobalKey<FormState> formKey = GlobalKey();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login() async {
    final LoginRequestBody loginRequestBody = LoginRequestBody(
      password: passwordController.text,
      phone: phoneController.text,
    );
    emit(LoginLoading());
    final result = await loginRepo.login(loginRequestBody);
    result.fold((l) => emit(LoginFailure(l.errMsg)), (r) async {
      await saveUserId(r.id!);
      print('user id saved ============== $userId');
      emit(LoginSuccess());
    });
  }

  Future<String> saveUserId(String uId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', uId);
    return userId = uId;
  }

  Future<String> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return userId = prefs.getString('userId')!;
  }
}
