import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_block_pruebas/core/error/exceptions.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // 🔴 No hay conexión a internet
    if (err.type == DioExceptionType.connectionError ||
        err.error is SocketException) {
      handler.reject(
        DioException(
          requestOptions: err.requestOptions,
          error: NetworkException(),
        ),
      );
      return;
    }
    // 🔴 Timeout de conexión
    if (err.type == DioExceptionType.connectionTimeout) {
      handler.reject(
        DioException(
          requestOptions: err.requestOptions,
          error: NetworkTimeoutException(),
        ),
      );
      return;
    }

    // 🔴 Error del servidor (HTTP)
    // Puedes mapear errores HTTP a errores de dominio
    final statusCode = err.response?.statusCode;
    /*switch (err.response?.statusCode) {
      case 400:
        handler.reject(
          DioException(
            requestOptions: err.requestOptions,
            error: 'Bad request',
          ),
        );
        break;

      case 404:
        handler.reject(
          DioException(
            requestOptions: err.requestOptions,
            error: 'Resource not found',
          ),
        );
        break;

      case 500:
        handler.reject(
          DioException(
            requestOptions: err.requestOptions,
            error: 'Server error',
          ),
        );
        break;

      default:
        handler.next(err);
    }*/

    handler.reject(
      DioException(
        requestOptions: err.requestOptions,
        error: ServerException(
          statusCode: statusCode,
          message: err.response?.statusMessage,
        ),
      ),
    );
  }
}
