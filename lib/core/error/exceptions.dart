import 'package:flutter_block_pruebas/core/error/failures.dart';

class ServerException implements Exception {
  final int? statusCode;
  final String? message;

  ServerException({this.statusCode, this.message});
}

class NetworkException implements Exception {
  final String message;

  NetworkException([this.message = 'No internet connection']);
}

class NetworkTimeoutException implements Exception {
  final String message;

  NetworkTimeoutException([this.message = 'Tiempo de conexión agotado']);
}
