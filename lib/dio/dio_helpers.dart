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
}
