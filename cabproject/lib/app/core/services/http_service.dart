import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HttpService {
  final Dio _dio = Dio();

  HttpService() {
    BaseOptions options = BaseOptions(
      baseUrl: dotenv.get('BASE_URL') + dotenv.get('API_V1'),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    _dio.options = options;
    _dio.interceptors.addAll(
      [
        LogInterceptor(
          responseHeader: false,
          responseBody: true,
          error: false,
        ),
      ],
    );
  }

  void setHeaders(Map<String, dynamic> data) {
    _dio.options.headers.addAll(data);
  }

  Future<Response> get(String url,
      {Map<String, dynamic>? queryParameters}) async {
    return await _dio.get(url, queryParameters: queryParameters);
  }

  Future<Response> post(String url, dynamic data,
      {Map<String, dynamic>? queryParameters}) async {
    return await _dio.post(
      url,
      data: data,
      queryParameters: queryParameters,
    );
  }

  Future<Response> put(String url, dynamic data,
      {Map<String, dynamic>? queryParameters}) async {
    return await _dio.put(url, data: data, queryParameters: queryParameters);
  }

  Future<Response> delete(String url,
      {Map<String, dynamic>? queryParameters}) async {
    return await _dio.delete(url, queryParameters: queryParameters);
  }
}
