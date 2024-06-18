import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:university_management/core/enums/connection_enum.dart';
import 'package:university_management/core/utils/app_constants.dart';
import 'package:university_management/core/utils/app_services.dart';
import 'package:university_management/dio/dio_helpers.dart';
import 'package:university_management/models/schedule/all_schedule_model.dart';

class ScheduleProvider extends ChangeNotifier {
  List<AllSchdeuleModel> allSchedule = [];
  List<AllSchdeuleModel> filtterdScheduleByName = [];
  List<AllSchdeuleModel> filtterdScheduleByYear = [];

  ConnectionEnum? connectionEnum;
  String errorMessage = '';

  int? year;

  void changeSelectedValue(value) {
    year = value;
    if (year != null) {
      filtterdScheduleByName = allSchedule
          .where(
            (element) => year == element.subject.year,
          )
          .toList();
      filtterdScheduleByYear = filtterdScheduleByName;
    } else {
      filtterdScheduleByName = allSchedule;
    }
    print(year);
    notifyListeners();
  }

  void runFilter(String? enteredKeyword) {
    if (year == null) {
      if (enteredKeyword == null || enteredKeyword.isEmpty) {
        filtterdScheduleByName = allSchedule;
      } else {
        filtterdScheduleByName = allSchedule
            .where((element) => element.subject.name
                .toLowerCase()
                .contains(enteredKeyword.toLowerCase()))
            .toList();
      }
      print(filtterdScheduleByName);
      notifyListeners();
    } else {
      if (enteredKeyword == null || enteredKeyword.isEmpty) {
        filtterdScheduleByName = filtterdScheduleByYear;
      } else {
        filtterdScheduleByName = filtterdScheduleByYear
            .where(
              (element) =>
                  element.subject.name.toLowerCase().contains(
                        enteredKeyword.toLowerCase(),
                      ) &&
                  year == element.subject.year,
            )
            .toList();
      }
      print(filtterdScheduleByName);
      notifyListeners();
    }
  }

  Future<void> getSchedule() async {
    connectionEnum = ConnectionEnum.connecting;
    notifyListeners();
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      String token = sharedPreferences.getString(AppStrings.tokenKey)!;
      Response<dynamic> response = await DioHelper.getSchedule(token: token);
      List<AllSchdeuleModel> schedule =
          AppServices.getListFromJson<AllSchdeuleModel>(
        response.data,
        (item) => AllSchdeuleModel.fromMap(item),
      );
      allSchedule = schedule;
      filtterdScheduleByName = schedule;
      connectionEnum = ConnectionEnum.connected;
      print(allSchedule);
      notifyListeners();
    } on DioException catch (e) {
      connectionEnum = ConnectionEnum.error;
      errorMessage = e.response!.data['message'];
      notifyListeners();
    }
  }
}
