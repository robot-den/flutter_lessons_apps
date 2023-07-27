import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class DioLoggerInterceptor extends Interceptor {
  DioLoggerInterceptor({required this.logger});

  final Logger logger;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logger.i('🟩 Dio: REQUEST[${options.method}] => PATH: ${options.path}');

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.i(
        '🟩 Dio: RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');

    super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    logger.i(
        '🟥 Dio: ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    super.onError(err, handler);
  }
}
