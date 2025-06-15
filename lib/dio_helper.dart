import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  // Initialize Dio
  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://jsonplaceholder.typicode.com/', // دا الـ API الوهمي
        receiveDataWhenStatusError: true,
        connectTimeout: Duration(seconds: 10),
        receiveTimeout: Duration(seconds: 10),
      ),
    );
    
  }

  // GET request
  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    return await dio.get(url, queryParameters: query);
  }
}
