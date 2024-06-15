import 'package:dio/dio.dart';
import 'package:flutter/Material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:university_management/core/enums/connection_enum.dart';
import 'package:university_management/core/utils/app_constants.dart';
import 'package:university_management/core/utils/app_services.dart';
import 'package:university_management/dio/dio_helpers.dart';
import 'package:university_management/models/subjects/not_my_subject_model.dart';

class NotMySubjectsProvider extends ChangeNotifier {
  List<NotMySubjectModel> notMySubjects = [];
  ConnectionEnum? connectionEnum;
  String errorMessage = '';

  Future<void> getNotMySubjects() async {
    connectionEnum = ConnectionEnum.connecting;
    notifyListeners();
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      String token = sharedPreferences.getString(AppStrings.tokenKey)!;
      Response<dynamic> response = await DioHelper.notMySubjects(token: token);
      List<NotMySubjectModel> subjects =
          AppServices.getListFromJson<NotMySubjectModel>(
        response.data,
        (item) => NotMySubjectModel.fromMap(item),
      );
      notMySubjects = subjects;
      connectionEnum = ConnectionEnum.connected;
      print(notMySubjects);
      notifyListeners();
    } on DioException catch (e) {
      connectionEnum = ConnectionEnum.error;
      errorMessage = e.response!.data['message'];
      notifyListeners();
    }
  }
}
