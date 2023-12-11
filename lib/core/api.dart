import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiUrls {
  static const String baseUrl = "https://api.carton.site/api";
  static const String createUser = "$baseUrl/customers/singup";
  static const String loginUser = "$baseUrl/users/login";
  static const String updateProfile = "$baseUrl/users/update-profile";

  static const Map<String, dynamic> defaultHeder = {
    'Content-Type': 'application/json',
  };
}

class Api {
  final _dio = Dio();
  Api() {
    _dio.options.baseUrl = ApiUrls.baseUrl;
    _dio.options.headers = ApiUrls.defaultHeder;
    _dio.interceptors.add(
      PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          responseBody: true,
          responseHeader: true),
    );
  }
  Dio get sendRequest => _dio;
}

class ApiResponse {
  bool success;
  dynamic data;
  String? message;
  ApiResponse({
    required this.success,
    this.data,
    this.message,
  });
  factory ApiResponse.fromResponse(Response response) {
    final data = response.data as Map<String, dynamic>;
    return ApiResponse(
      success: data['success'],
      data: data['data'],
      message: data['message'] ?? 'UnExpected Error',
    );
  }
}
