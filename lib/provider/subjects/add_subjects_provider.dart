import 'package:dio/dio.dart';
import 'package:flutter/Material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:university_management/core/enums/connection_enum.dart';
import 'package:university_management/core/utils/app_constants.dart';
import 'package:university_management/dio/dio_helpers.dart';
import 'package:university_management/models/subjects/add_subject_model.dart';

class AddSubjectsProvider extends ChangeNotifier {
  List<AddSubjectModel> data = [];
  ConnectionEnum? connectionEnum;
  String errorMessage = '';

  void fillAndRemoveData(AddSubjectModel addSubjectModel) {
    if (!data.contains(addSubjectModel)) {
      data.add(addSubjectModel);
      print(data);
      notifyListeners();
    } else {
      data.remove(addSubjectModel);
      print(data);
      notifyListeners();
    }
  }

  Future<void> addSubjects({
    required void Function() onSuccess,
    required void Function() onError,
  }) async {
    connectionEnum = ConnectionEnum.connecting;
    notifyListeners();
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      String token = sharedPreferences.getString(AppStrings.tokenKey)!;
      await DioHelper.addSubjects(
        token: token,
        data: data.map((e) => e.toMap()).toList(),
      );
      connectionEnum = ConnectionEnum.connected;
      data.clear();
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
