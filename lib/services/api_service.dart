import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.example.com', 
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );

  Future<dynamic> getAboutUs() async {
    try {
      final response = await _dio.get('/about');
      return response.data;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  
}
