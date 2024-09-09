import 'package:dio/dio.dart';
import 'package:raymond_test/GlobalVariables/globalVariables.dart';

class DioClient {
  final Dio _dio = Dio();

  DioClient() {
    _dio.options.baseUrl = URI; // Base URL for the API
    _dio.options.connectTimeout = const Duration(seconds: 5); // Connection timeout
    _dio.options.receiveTimeout = const Duration(seconds: 3);  // Response timeout

    // Optionally add interceptors for logging or authentication
    _dio.interceptors.add(LogInterceptor(responseBody: true)); // Logs responses
  }

  Dio get client => _dio;
}
