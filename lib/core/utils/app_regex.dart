class AppRegex {
  // static bool isEmailValid(String email) {
  //   return RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
  //       .hasMatch(email);
  // }
  //
  // static bool isPasswordValid(String password) {
  //   return RegExp(
  //           r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
  //       .hasMatch(password);
  // }
  //
  // static bool hasLowerCase(String password) {
  //   return RegExp(r'^(?=.*[a-z])').hasMatch(password);
  // }
  //
  // static bool isPhoneValid(String password) {
  //   return RegExp(r'^01[0-2,5]{1}[0-9]{8}$').hasMatch(password);
  // }

  static bool isLevelValid(String level) {
    return RegExp(r'^(senior|fresh|junior|midLevel)$').hasMatch(level);
  }

  // static bool hasUpperCase(String password) {
  //   return RegExp(r'^(?=.*[A-Z])').hasMatch(password);
  // }
  //
  // static bool hasNumber(String password) {
  //   return RegExp(r'^(?=.*?[0-9])').hasMatch(password);
  // }
  //
  // static bool hasSpecialCharacter(String password) {
  //   return RegExp(r'^(?=.*?[!@#\$&*~])').hasMatch(password);
  // }
  //
  // static bool hasMinLength(String password) {
  //   return RegExp(r'^(?=.{8,})').hasMatch(password);
  // }
}
