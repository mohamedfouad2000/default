import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://student.valuxapps.com/api/',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData({
    required String url,
    String lang = 'en',
    required String? token,
    Map<String, dynamic>? query,

  }) async {
    dio!.options.headers = {
      'lang': lang,
      'Authorization': token!,
      'Content-Type': 'application/json',
    };
    return await dio!.get(url, queryParameters: query);
  }

  static Future<Response> getDataWithoutToken({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'lang': lang,
      'Authorization': token ?? '',
      'Content-Type': 'application/json',
    };
    return await dio!.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization':'$token',
    };
    return await dio!.post(
      url,
      data: data,
    );
  }

  static Future<Response> postDataWithoutToken({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'lang': lang,
      'Authorization': token ?? '',
      'Content-Type': 'application/json',
    };
    return await dio!.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'lang': lang,
      'Authorization': token ?? '',
      'Content-Type': 'application/json',
    };
    return await dio!.put(
      url,
      queryParameters: query,
      data: data,
    );
  }

  // static Future<Response> removeData({
  //   required String url,
  //   Map<String, dynamic>? query,
  //   required Map<String, dynamic> data,
  //   String lang = 'en',
  //   String? token,
  // }) async {
  //   dio!.options.headers = {
  //     'lang': lang,
  //     'Authorization': token ?? '',
  //     'Content-Type': 'application/json',
  //   };
  //   return await dio!.delete(
  //     url,
  //     queryParameters: query,
  //     data: data,
  //   );
  // }
}
