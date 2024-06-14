import 'package:dio/dio.dart';
import 'package:flutter/Material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:university_management/core/enums/connection_enum.dart';
import 'package:university_management/core/utils/app_constants.dart';
import 'package:university_management/dio/dio_helpers.dart';
import 'package:university_management/models/auth/my_details_model.dart';

class MyDetalisProvider extends ChangeNotifier {
  MyDetailsModel? student;
  ConnectionEnum? connectionEnum;
  String errorMessage = '';

  Future<void> getMyDetails() async {
    connectionEnum = ConnectionEnum.connecting;
    notifyListeners();
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      String token = sharedPreferences.getString(AppStrings.tokenKey)!;
      Response<dynamic> response = await DioHelper.adminDetails(token: token);
      student = MyDetailsModel.fromMap(response.data['data']);
      connectionEnum = ConnectionEnum.connected;
      print(student);
      notifyListeners();
    } on DioException catch (e) {
      connectionEnum = ConnectionEnum.error;
      errorMessage = e.response!.data['message'];
      notifyListeners();
    }
  }
}
