import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:university_management/core/enums/connection_enum.dart';
import 'package:university_management/core/utils/app_constants.dart';
import 'package:university_management/dio/dio_helpers.dart';
import 'package:university_management/models/auth/change_email_model.dart';

class ChangeEmailProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();

  ConnectionEnum? connectionEnum;
  String errorMessage = '';

  void fillEmailController(String email) {
    emailController.text = email;
    notifyListeners();
  }

  Future<void> changeEmail({
    required void Function() onSuccess,
    required void Function() onError,
  }) async {
    if (AppKeys.changeEmailKey.currentState!.validate()) {
      ChangeEmailModel data = ChangeEmailModel(email: emailController.text);
      connectionEnum = ConnectionEnum.connecting;
      notifyListeners();
      try {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        String token = sharedPreferences.getString(AppStrings.tokenKey)!;
        await DioHelper.changeEmail(
          data: data.toMap(),
          token: token,
        );
        connectionEnum = ConnectionEnum.connected;
        onSuccess();
        notifyListeners();
      } on DioException catch (e) {
        connectionEnum = ConnectionEnum.error;
        errorMessage = e.response!.data['message'];
        print(errorMessage);
        onError();
        notifyListeners();
      } catch (e) {
        connectionEnum = ConnectionEnum.error;
        onError();
        notifyListeners();
      }
    }
  }
}
