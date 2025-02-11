part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignupInitial extends SignUpState {}
final class SignUpLoading extends SignUpState {}
final class SignUpFailure extends SignUpState {
  final String errMsg;
  SignUpFailure(this.errMsg);
}
final class SignUpSuccess extends SignUpState {}
