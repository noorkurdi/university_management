import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:university_management/core/enums/connection_enum.dart';
import 'package:university_management/core/utils/app_constants.dart';
import 'package:university_management/dio/dio_helpers.dart';
import 'package:university_management/models/auth/change_password_model.dart';

class ChangePasswordProvider extends ChangeNotifier {
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController newPasswordConfirmController = TextEditingController();

  ConnectionEnum? connectionEnum;
  String errorMessage = '';


  Future<void> changePassword({
    required void Function() onSuccess,
    required void Function() onError,
  }) async {
    if (AppKeys.changePasswordKey.currentState!.validate()) {
      ChangePasswordModel data = ChangePasswordModel(
        password: oldPasswordController.text,
        newPassword: newPasswordController.text,
        newPasswordConfirm: newPasswordConfirmController.text,
      );
      connectionEnum = ConnectionEnum.connecting;
      notifyListeners();
      try {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        String token = sharedPreferences.getString(AppStrings.tokenKey)!;
        await DioHelper.changePassword(
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
