import 'package:dio/dio.dart';
import 'package:partyspot/networking/api_urls.dart' show ApiUrl;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioInjector {
  late Dio _dio;

  DioInjector() {
    init();
  }

  Dio get dio => _dio;

  void init() {
    _dio = Dio(BaseOptions(
      baseUrl: ApiUrl.baseUrl,
      receiveDataWhenStatusError: true,
      validateStatus: (status) {
        return true;
      },
      connectTimeout: const Duration(seconds: 300),
      receiveTimeout: const Duration(seconds: 300),
      sendTimeout: const Duration(seconds: 300),
    ));

    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
      compact: true,
      maxWidth: 90,
    ));

    _dio.interceptors.add(InterceptorsWrapper(
      onResponse: (response, handler) {
        if (response.statusCode != 200 && response.statusCode != 201) {
          return handler.reject(DioException(
              requestOptions: response.requestOptions, response: response, type: DioExceptionType.badResponse));
        }
        return handler.next(response); // Continue normally
      },
      onError: (DioException e, handler) {
        return handler.next(e); // Continue passing the error
      },
    ));
  }
}

class CustomInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
    return handler.next(options);
  }

  @override
  Future onResponse(Response response, ResponseInterceptorHandler handler) async {
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    return handler.next(err);
  }
}
