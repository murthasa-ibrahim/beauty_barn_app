import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:machine_test_superlabs/src/utils/logger/app_logger.dart';

import '../base/base.dart';

class DioApiService {
  factory DioApiService() => _instance;
  static final DioApiService _instance = DioApiService._internal();
  DioApiService._internal() {
    _initializeDio();
  }

  late final Dio _dio;

  void _initializeDio() {
    _dio = Dio(
      BaseOptions(
        baseUrl: Api.baseUrl,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        sendTimeout: const Duration(seconds: 15),
      ),
    );

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = Api.token;
        if (token.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        if (kDebugMode) {
          // AppLogger.d(
          //     " [${options.method}] ${options.uri} \nHeaders: ${options.headers}");
        }
        return handler.next(options);
      },
      onResponse: (response, handler) {
        if (kDebugMode) {
          // AppLogger.i(
          //     "[${response.statusCode}] ${response.requestOptions.uri}");
        }
        return handler.next(response);
      },
      onError: (DioException e, handler) async {
        if (Api.isLogEnable) {
          AppLogger.e("Dio Error: ${e.message}");
        }

        if (e.response?.statusCode == 401) {
          AppLogger.w("⚠️ Unauthorized - Token may have expired");
        }

        return handler.next(e);
      },
    ));
  }

  /// -------------------- COMMON REQUEST METHODS --------------------

  Future<Response<dynamic>> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
  }) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        options: options,
      );
      return response;
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  Future<Response<dynamic>> post(
    String endpoint, {
    Map<String, dynamic>? data,
    Options? options,
  }) async {
    try {
      final response = await _dio.post(endpoint, data: data, options: options);
      return response;
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  Future<Response<dynamic>> put(
    String endpoint, {
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await _dio.put(endpoint, data: data);
      return response;
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  Future<Response<dynamic>> patch(
    String endpoint, {
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await _dio.patch(endpoint, data: data);
      return response;
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  Future<Response<dynamic>> delete(
    String endpoint, {
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await _dio.delete(endpoint, data: data);
      return response;
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  /// -------------------- PRIVATE HELPERS --------------------

  Response _handleError(DioException e) {
    final statusCode = e.response?.statusCode ?? 500;
    final message =
        e.response?.data?['message'] ?? e.message ?? 'Unknown Error';

    AppLogger.e("Dio Error [$statusCode]: $message");

    return Response(
      requestOptions: e.requestOptions,
      statusCode: statusCode,
      data: {
        'error': true,
        'statusCode': statusCode,
        'message': message,
        'data': e.response?.data,
      },
    );
  }
}
