import 'dart:io';

import 'package:dio/dio.dart';
import 'package:git_intro/constants/api_url.dart';
import 'package:git_intro/helpers/user_email.dart';

class AuthApi {
  Dio dioApi() {
    BaseOptions options = BaseOptions(
      baseUrl: ApiURL.baseUrl,
      headers: {
        "x-api-key": ApiURL.apiKey,
        HttpHeaders.contentTypeHeader: "application/json"
      },
      responseType: ResponseType.json,
    );

    final dio = Dio();
    return dio;
  }

  Future<Map<String, dynamic>?> _getRequest({endpoint, param}) async {
    try {
      final dio = dioApi();
      final result = await dio.get(endpoint, queryParameters: param);
      return result.data;
    } on DioError catch (e) {
      if (e.type == DioErrorType.sendTimeout) {
        print("error timeout");
      }
      print("error dio");
    } catch (e) {
      print("error lainnya");
    }
  }

  Future<Map<String, dynamic>?> _postRequest({endpoint, body}) async {
    try {
      final dio = dioApi();
      final result = await dio.post(endpoint, data: body);
      return result.data;
    } on DioError catch (e) {
      if (e.type == DioErrorType.sendTimeout) {
        print("error timeout");
      }
      print("error dio");
    } catch (e) {
      print("error lainnya");
    }
  }

  Future<Map<String, dynamic>?> getUserByEmail() async {
    final result = await _getRequest(
        endpoint: ApiURL.users, param: {"email": UserEmail.getUserEmail()});
    return result;
  }
}
