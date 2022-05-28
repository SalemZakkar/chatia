class ExceptionCases {
  static bool checkEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  static bool checkPassword(String password) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    return (!regex.hasMatch(password) && password.isEmpty);
  }

  static bool checkUsername(String username) {
    return !(!username.contains(" ") &&
        username.contains(RegExp("[A-z]")) &&
        !username.contains(RegExp("[أ-ي]")) &&
        username.isNotEmpty &&
        username.trim().isNotEmpty);
  }
}
