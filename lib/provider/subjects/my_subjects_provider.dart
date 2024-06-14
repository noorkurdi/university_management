import 'package:dio/dio.dart';
import 'package:flutter/Material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:university_management/core/enums/connection_enum.dart';
import 'package:university_management/core/utils/app_constants.dart';
import 'package:university_management/core/utils/app_services.dart';
import 'package:university_management/dio/dio_helpers.dart';
import 'package:university_management/models/subjects/student_subject_model.dart';

class MySubjectsProvider extends ChangeNotifier {
  List<MySubjectModel>? mySubjects;
  ConnectionEnum? connectionEnum;
  String errorMessage = '';

  Future<void> getMySubjects() async {
    connectionEnum = ConnectionEnum.connecting;
    notifyListeners();
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      String token = sharedPreferences.getString(AppStrings.tokenKey)!;
      Response<dynamic> response = await DioHelper.mySubjects(token: token);
      List<MySubjectModel> subjects =
          AppServices.getListFromJson<MySubjectModel>(
        response.data,
        (item) => MySubjectModel.fromMap(item),
      );
      mySubjects = subjects;
      connectionEnum = ConnectionEnum.connected;
      print(mySubjects);
      notifyListeners();
    } on DioException catch (e) {
      connectionEnum = ConnectionEnum.error;
      errorMessage = e.response!.data['message'];
      notifyListeners();
    }
  }
}
