import 'package:flutter/material.dart';
import 'package:university_management/core/utils/app_constants.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController uniNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode uniNumberFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  bool isPasswordShow = true;

  Future<void> login() async {
    if (AppKeys.loginKey.currentState!.validate()) {}
  }

  void showPassword() {
    isPasswordShow = !isPasswordShow;
    notifyListeners();
  }
}
