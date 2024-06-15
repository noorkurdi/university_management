import 'package:dio/dio.dart';
import 'package:flutter/Material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:university_management/core/enums/connection_enum.dart';
import 'package:university_management/core/utils/app_constants.dart';
import 'package:university_management/core/utils/app_services.dart';
import 'package:university_management/dio/dio_helpers.dart';
import 'package:university_management/models/schedule/my_schedule_model.dart';

class TodayScheduleProvider extends ChangeNotifier {
  List<MyScheduleModel> todaySchedule = [];
  ConnectionEnum? connectionEnum;
  String errorMessage = '';

  Future<void> getTodaySchedule() async {
    connectionEnum = ConnectionEnum.connecting;
    notifyListeners();
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      String token = sharedPreferences.getString(AppStrings.tokenKey)!;
      int day = DateTime.now().weekday;
      int today = AppMaps.weekOfDay[day]!;
      print(today);
      Response<dynamic> response =
          await DioHelper.todaySchedule(token: token, day: today);
      List<MyScheduleModel> schedule =
          AppServices.getListFromJson<MyScheduleModel>(
        response.data,
        (item) => MyScheduleModel.fromMap(item),
      );
      todaySchedule = schedule;
      connectionEnum = ConnectionEnum.connected;
      print(todaySchedule);
      notifyListeners();
    } on DioException catch (e) {
      connectionEnum = ConnectionEnum.error;
      errorMessage = e.response!.data['message'];
      notifyListeners();
    }
  }
}
