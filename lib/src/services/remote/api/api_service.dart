import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:machine_test_superlabs/src/utils/logger/app_logger.dart';

import '../../../../config/dependency_injection/dependency_injection.dart';
import '../../local/app_cache.dart';
import '../base/base.dart';

class DioApiService {
  factory DioApiService() => _instance;

  DioApiService._internal() {
    _initializeDio();
  }
  static bool isLogout = true;
  static final DioApiService _instance = DioApiService._internal();

  final Dio _dio = Dio();

  void _initializeDio() {
    _dio.options = BaseOptions(
      baseUrl: Api.baseUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
  }

  String? authToken = "";
  Future<void> _setAuthTokenHeader({bool clearToken = false}) async {
    final token = locator<SharedPref>().getToken();
    if (token != null) {
      _dio.options.headers['Authorization'] = 'Bearer $token';
      if (kDebugMode) {
        AppLogger.e("Token------------------>$token");
      }
    } else if (clearToken) {
      _dio.options.headers.remove('Authorization');
    }
    authToken = token;
    return;
  }

  Future<Response> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
    bool? isAuth,
  }) async {
    try {
      AppLogger.e(endpoint);
      if (isAuth == null || isAuth == true) {
        await _setAuthTokenHeader();
      }

      final response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        options: options,
      );

      return response;
    } on DioException catch (e, s) {
      if (Api.isLogEnable) {
        AppLogger.i(endpoint);
        AppLogger.e(e.message);
        AppLogger.trace(e.error, s);
      }

      return Response(
        requestOptions: RequestOptions(),
        statusCode: e.response?.statusCode ?? 404,
        data: e.response?.data,
      );
    } catch (e) {
      return Response(
        requestOptions: RequestOptions(),
        statusCode: 404,
        data: null,
      );
    } finally {
      if (cancelToken?.isCancelled == false) {
        cancelToken?.cancel();
      }
    }
  }

  Future<Response> post(
    String endpoint, {
    Map<String, dynamic>? data,
    bool clearToken = false,
    Options? options,
  }) async {
    try {
      await _setAuthTokenHeader(clearToken: clearToken);
      final response = await _dio.post(endpoint, data: data, options: options);

      return response;
    } on DioException catch (e, stack) {
      if (Api.isLogEnable) {
        AppLogger.i(e.requestOptions.data);
        AppLogger.trace(e.error, stack);
        AppLogger.w(e.response?.statusCode);
      }

      return Response(
        requestOptions: RequestOptions(),
        statusCode: e.response?.statusCode,
        data: e.response?.data,
      );
    } catch (e) {
      return Response(
        requestOptions: RequestOptions(),
        statusCode: 404,
        data: null,
      );
    }
  }

  Future<Response> postWithoutToken(String endpoint,
      {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.post(endpoint, data: data);
      if (Api.isLogEnable) {
        AppLogger.i(endpoint);
        AppLogger.d(response);
      }

      return response;
    } on DioException catch (e, stack) {
      if (Api.isLogEnable) {
        AppLogger.i(e.requestOptions.data);
        AppLogger.w(e.response?.statusCode);
        AppLogger.trace(e.error, stack);
      }

      return Response(
        requestOptions: RequestOptions(),
        statusCode: e.response?.statusCode,
        data: e.response?.data,
      );
    }
  }

  Future<Response> put(String endpoint, {Map<String, dynamic>? data}) async {
    try {
      await _setAuthTokenHeader();
      final response = await _dio.put(endpoint, data: data);
      if (Api.isLogEnable) {
        AppLogger.d(response);
      }

      return response;
    } on DioException catch (e, stack) {
      if (Api.isLogEnable) {
        AppLogger.d(e.response);
        AppLogger.trace(e.error, stack);
      }

      return Response(
        requestOptions: RequestOptions(),
        statusCode: e.response?.statusCode,
        data: e.response?.data,
      );
    }
  }

  Future<Response> patch(String endpoint, {Map<String, dynamic>? data}) async {
    try {
      await _setAuthTokenHeader();
      final response = await _dio.patch(endpoint, data: data);
      if (Api.isLogEnable) {
        AppLogger.d(response);
      }

      return response;
    } on DioException catch (e, stack) {
      if (Api.isLogEnable) {
        AppLogger.trace(e.error, stack);
        AppLogger.i(e.requestOptions.uri);
        AppLogger.d(e.response);
      }

      return Response(
          requestOptions: RequestOptions(),
          statusCode: e.response?.statusCode,
          data: e.response?.data);
    }
  }

  Future<Response> postFormData(
    String endpoint, {
    required Map<String, dynamic> data,
  }) async {
    final formData = FormData.fromMap(data);
    try {
      await _setAuthTokenHeader();
      final response = await _dio.post(endpoint, data: formData);
      AppLogger.e(
          "Status Code------>${response.statusCode}+ Status Message---->${response.statusMessage}");
      return response;
    } on DioException catch (e, stack) {
      if (Api.isLogEnable) {
        AppLogger.trace(e, stack);
      }

      return Response(
        requestOptions: RequestOptions(),
        statusCode: e.response?.statusCode,
        data: e.response?.data,
      );
    }
  }

  Future<Response> patchFormData(
    String endpoint, {
    required Map<String, dynamic> data,
  }) async {
    final formData = FormData.fromMap(data);
    try {
      await _setAuthTokenHeader();
      final response = await _dio.patch(endpoint, data: formData);
      AppLogger.e(
          "Status Code------>${response.statusCode}+ Status Message---->${response.statusMessage}");
      return response;
    } on DioException catch (e, stack) {
      if (Api.isLogEnable) {
        AppLogger.trace(e, stack);
      }

      return Response(
        requestOptions: RequestOptions(),
        statusCode: e.response?.statusCode,
        data: e.response?.data,
      );
    }
  }

  Future<Response> postImage(String endpoint, {required FormData data}) async {
    try {
      await _setAuthTokenHeader();
      final response = await _dio.post(endpoint, data: data);
      if (Api.isLogEnable) {
        AppLogger.e(response.data);
        AppLogger.i(response.requestOptions.uri);
        AppLogger.e(
            "Status Code------>${response.statusCode}+ Status Message---->${response.statusMessage}");
      }

      return response;
    } on DioException catch (e) {
      AppLogger.i(e.response?.requestOptions.uri);
      return Response(
        requestOptions: RequestOptions(),
        statusCode: 404,
        data: e.response?.data,
      );
    }
  }

  Future<Response> delete(String endpoint, {Map<String, dynamic>? data}) async {
    try {
      await _setAuthTokenHeader();
      final response = await _dio.delete(endpoint, data: data);
      if (Api.isLogEnable) {
        AppLogger.e(
            "Status Code------>${response.statusCode}+ Status Message---->${response.statusMessage}");
        AppLogger.d(response);
      }

      return response;
    } on DioException catch (e, stack) {
      if (Api.isLogEnable) {
        AppLogger.trace(e.response, stack);
      }

      return Response(
        requestOptions: RequestOptions(),
        statusCode: 404,
        data: e.response?.data,
      );
    }
  }
}
