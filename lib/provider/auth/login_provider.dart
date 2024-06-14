import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:university_management/core/enums/connection_enum.dart';
import 'package:university_management/core/utils/app_constants.dart';
import 'package:university_management/core/utils/app_services.dart';
import 'package:university_management/dio/dio_helpers.dart';
import 'package:university_management/models/auth/login_model.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController uniNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode uniNumberFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  ConnectionEnum? connectionEnum;

  String errorMessage = '';
  bool isPasswordShow = true;

  Future<void> login({
    required void Function() onSuccess,
    required void Function() onError,
  }) async {
    if (AppKeys.loginKey.currentState!.validate()) {
      LoginModel data = LoginModel(
        uniNumber: uniNumberController.text.trim(),
        password: passwordController.text,
      );
      connectionEnum = ConnectionEnum.connecting;
      notifyListeners();
      try {
        Response<dynamic> response = await DioHelper.login(data: data.toMap());
        String token = response.data['token'];
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString(AppStrings.tokenKey, token);
        connectionEnum = ConnectionEnum.connected;
        notifyListeners();
        onSuccess();
      } on DioException catch (e) {
        connectionEnum = ConnectionEnum.error;
        errorMessage = e.response!.data['message'];
        onError();
        notifyListeners();
      } catch (e) {
        connectionEnum = ConnectionEnum.error;
        notifyListeners();
        onError();
      }
    }
  }

  void showPassword() {
    isPasswordShow = !isPasswordShow;
    notifyListeners();
  }
}
