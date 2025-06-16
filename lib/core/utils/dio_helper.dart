// lib/helpers/dio_helper.dart

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioHelper {
  static late Dio dio;

  static String currentLanguage = 'en'; // ← ← ← اللغة اللي هنبعتها في الهيدر

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://jsonplaceholder.typicode.com/', // مؤقت لتجريب
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // ← ← ← ← ← ← ← ← أهم سطر: اللغة بتتبعت في الهيدر هنا
          options.headers.addAll({
            'lang': currentLanguage,
            'Content-Type': 'application/json',
          });

          if (kDebugMode) {
            print('🌍 REQUEST [${options.uri}]');
            print('Headers: ${options.headers}');
          }

          return handler.next(options);
        },
        onResponse: (response, handler) {
          if (kDebugMode) print('✅ RESPONSE: ${response.statusCode}');
          return handler.next(response);
        },
        onError: (e, handler) {
          if (kDebugMode) print('❌ ERROR: ${e.message}');
          return handler.next(e);
        },
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    return await dio.get(url, queryParameters: query);
  }
  
  static Future<Response> postData({
  required String url,
  Map<String, dynamic>? data,
}) async {
  return await dio.post(
    url,
    data: data,
  );
}

}
