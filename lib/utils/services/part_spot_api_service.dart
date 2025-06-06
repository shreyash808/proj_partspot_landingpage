import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:partyspot/networking/dio_injector.dart';
import 'package:partyspot/networking/model/error_response_model.dart';
import 'package:partyspot/utils/constants/key_constants.dart';
import 'package:partyspot/utils/constants/service_const.dart';

class PartySportApiService {
  final apiClient = locator<DioInjector>();

  Map<String, dynamic> getHeaders({String? token}) {
    String accessToken =
        token ?? (GetStorage().read(KeysConsts.accessToken) ?? '');
    log('Access Token :: $accessToken');
    return {
      'Authorization': 'Bearer $accessToken',
    };
  }

  Future<Response> getRequest(
    String endpoint, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? body,
  }) async {
    try {
      final response = await apiClient.dio.get(
        endpoint,
        queryParameters: queryParams,
        data: body,
        options: Options(headers: getHeaders()),
      );
      return response;
    } on DioException catch (dioError) {
      throw _handleDioError(dioError);
    } on TimeoutException catch (_) {
      throw ErrorResponse(message: 'Request timed out');
    } catch (error) {
      throw ErrorResponse(message: 'Unexpected error occurred');
    }
  }

  Future<dynamic> getRequestWithCustomUrl(String url) async {
    try {
      final dio = Dio();
      final response = await dio.get(Uri.parse(url).toString());
      return response.statusCode == 200 && response.data != null
          ? response.data
          : null;
    } catch (error) {
      log('Erorr :: ${error.toString()}');
      return null;
    }
  }

  Future<Response> postRequest(
    String endpoint, {
    Object? data,
    String? accessToken,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    bool useClientWithoutTimeout = false,
  }) async {
    try {
      final client = apiClient.dio;
      final response = await client.post(
        endpoint,
        data: data,
        cancelToken: cancelToken,
        options: Options(headers: getHeaders(token: accessToken)),
        onSendProgress: onSendProgress,
      );
      return response;
    } on DioException catch (dioError) {
      throw _handleDioError(dioError);
    } on TimeoutException catch (_) {
      throw ErrorResponse(message: 'Request timed out');
    } catch (error) {
      throw Exception('Unexpected error occurred');
    }
  }

  Future<Response> postRequestWithFormData(
    String endpoint, {
    required Map<String, dynamic> formBody,
    String? accessToken,
    CancelToken? cancelToken,
    Function(int, int)? onSendProgress,
    bool useClientWithoutTimeout = false,
  }) async {
    try {
      FormData formData = FormData.fromMap(formBody);
      final client = apiClient.dio;
      final response = await client.post(
        endpoint,
        data: formData,
        onSendProgress: onSendProgress,
        cancelToken: cancelToken,
        options: Options(headers: getHeaders(token: accessToken)),
      );
      return response;
    } on DioException catch (dioError) {
      throw _handleDioError(dioError);
    } on TimeoutException catch (_) {
      throw ErrorResponse(message: 'Request timed out');
    } catch (error) {
      throw ErrorResponse(message: 'Unexpected error occurred');
    }
  }

  Future<Response> putRequest(
    String endpoint, {
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await apiClient.dio.put(
        endpoint,
        data: data,
        options: Options(headers: getHeaders()),
      );
      return response;
    } on DioException catch (dioError) {
      throw _handleDioError(dioError);
    } on TimeoutException catch (_) {
      throw ErrorResponse(message: 'Request timed out');
    } catch (error) {
      throw ErrorResponse(message: 'Unexpected error occurred');
    }
  }

  Future<Response> deleteRequest(
    String endpoint, {
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await apiClient.dio.delete(
        endpoint,
        data: data,
        options: Options(headers: getHeaders()),
      );
      return response;
    } on DioException catch (dioError) {
      throw _handleDioError(dioError);
    } on TimeoutException catch (_) {
      throw ErrorResponse(message: 'Request timed out');
    } catch (error) {
      throw ErrorResponse(message: 'Unexpected error occurred');
    }
  }

  _handleDioError(DioException error) {
    String errorMessage = 'Something went wrong!';
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        errorMessage = 'Connection timeout';
      case DioExceptionType.sendTimeout:
        errorMessage = 'Send timeout';
      case DioExceptionType.receiveTimeout:
        errorMessage = 'Receive timeout';
      case DioExceptionType.badResponse:
        if (error.response != null) {
          return _handleErrorResponse(error.response!);
        } else {
          errorMessage =
              'Received invalid status code: ${error.response?.statusCode}';
        }
        break;
      case DioExceptionType.cancel:
      //   errorMessage = StringConsts.requestCancelled;
      case DioExceptionType.connectionError:
        errorMessage = '';
      case DioExceptionType.badCertificate:
        errorMessage = 'Bad Certificate';
      case DioExceptionType.unknown:
        errorMessage = 'Something went wrong';
    }
    return ErrorResponse(message: errorMessage);
  }

  ErrorResponse? _handleErrorResponse(Response response) {
    try {
      final ErrorResponse errorResponseModel = ErrorResponse.fromJson(
        response.data ?? {},
      );
      return errorResponseModel;
    } catch (e) {
      return ErrorResponse(message: 'Something went wrong');
    }
  }
}
