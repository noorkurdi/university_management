import 'package:dio/dio.dart';
import 'package:university_management/core/utils/app_constants.dart';
import 'package:university_management/dio/end_points.dart';

class DioHelper {
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: AppStrings.baseUrl,
      receiveDataWhenStatusError: true,
      headers: {
        "Accept": "application/json",
        "Connection": 'keep-alive',
      },
    ),
  );

  static Future<Response> login({
    required Map<String, dynamic> data,
  }) async {
    return await dio.post(
      LOGIN,
      data: data,
    );
  }

  static Future<Response> adminDetails({
    required String token,
  }) async {
    return await dio.get(
      MY_DETAILS,
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
  }

  static Future<Response> changeEmail({
    required Map<String, dynamic> data,
    required String token,
  }) async {
    return await dio.post(
      CHANGE_EMAIL,
      data: data,
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
  }

  static Future<Response> changePassword({
    required Map<String, dynamic> data,
    required String token,
  }) async {
    return await dio.post(
      CHANGE_PASSWORD,
      data: data,
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
  }

  /////////SUBJECTS///////////
  static Future<Response> mySubjects({
    required String token,
  }) async {
    return await dio.get(
      MY_SUBJECTS,
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
  }

  static Future<Response> notMySubjects({
    required String token,
  }) async {
    return await dio.get(
      NOT_MY_SUBJECTS,
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
  }

  static Future<Response> addSubjects({
    required String token,
    required List<Map<String, dynamic>> data,
  }) async {
    return await dio.post(
      ADD_SUBJECT,
      data: data,
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
  }

  //////////SCHEDULE///////////
  static Future<Response> todaySchedule({
    required String token,
    required int day,
  }) async {
    return await dio.get(
      TODAY_SCHEUDLE,
      queryParameters: {"day": day},
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
  }

  static Future<Response> getSchedule({
    required String token,
  }) async {
    return await dio.get(
      SCHEUDLE,
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
  }
}
