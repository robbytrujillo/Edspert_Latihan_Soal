import 'dart:io';

import 'package:dio/dio.dart';
import 'package:git_intro/constants/api_url.dart';
import 'package:git_intro/helpers/user_email.dart';
import 'package:git_intro/models/network_response.dart';

class LatihanSoalApi {
  Dio dioApi() {
    BaseOptions options = BaseOptions(
      baseUrl: ApiURL.baseUrl,
      headers: {
        "x-api-key": ApiURL.apiKey,
        HttpHeaders.contentTypeHeader: "application/json"
      },
      responseType: ResponseType.json,
    );

    final dio = Dio(options);
    return dio;
  }

  Future<NetworkResponse> _getRequest({endpoint, param}) async {
    // try {
    final dio = dioApi();
    final result = await dio.get(endpoint, queryParameters: param);
    return NetworkResponse.success(result.data);
    // } on DioError catch (e) {
    //   if (e.type == DioErrorType.sendTimeout) {
    //     return NetworkResponse.error(data: null, message: "request timeout");
    //   }
    //   return NetworkResponse.error(data: null, message: "request error dio");
    //   // print("error dio");
    // } catch (e) {
    //   return NetworkResponse.error(data: null, message: "other error");
    //   // print("error lainnya");
    // }
  }

  //getUserByEmail() {}

  postRegister(Map<String, String?> json) {
    //Future<Map<String, dynamic>?> _getRequest({endpoint, param}) async {
    // try {

    /// final dio = dioApi();
    // final result = await dio.get(endpoint, queryParameters: param);
    // return result.data;

    // } on DioError catch (e) {
    //   if (e.type == DioErrorType.sendTimeout) {
    //     print("error timeout");
    //   }
    //   print("error dio");
    // } catch (e) {
    //   print("error lainnya");
    // }
  }

  Future<NetworkResponse> _postRequest({endpoint, body}) async {
    try {
      final dio = dioApi();
      final result = await dio.post(endpoint, data: body);
      return NetworkResponse.success(result.data);
    } on DioError catch (e) {
      if (e.type == DioErrorType.sendTimeout) {
        return NetworkResponse.error(data: null, message: "request timeout");
      }
      return NetworkResponse.error(data: null, message: "request error dio");
      // print("error dio");
    } catch (e) {
      return NetworkResponse.error(data: null, message: "other error");
      // print("error lainnya");
    }
  }

  // dioApi() {}

  Future<NetworkResponse> getMapel() async {
    final result = await _getRequest(
      endpoint: ApiURL.latihanMapel,
      param: {
        "major_name": "IPA",
        "user_email": await UserEmail.getUserEmail(),
      },
    );
    return result;
  }

  Future<NetworkResponse> getPaketSoal(id) async {
    final result = await _getRequest(
      endpoint: ApiURL.latihanPaketSoal,
      param: {
        "exercise_id": id,
        "user_email": await UserEmail.getUserEmail(),
      },
    );
    return result;
  }

  Future<NetworkResponse> getBanner() async {
    final result = await _getRequest(
      endpoint: ApiURL.banner,
      // param: {
      //   "limit": "IPA",
      // },
    );
    return result;
  }
  //_getRequest({endpoint, param}) {}

  // Future<NetworkResponse?> postRegister(body) async {
  //   final result = await _postRequest(
  //     endpoint: ApiURL.userRegistrasi,
  //     body: body,
  //   );
  //   return result;
  // }
}
