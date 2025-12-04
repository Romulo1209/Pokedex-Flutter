import 'package:dio/dio.dart';

class DioClient {
  late final Dio dio;

  DioClient() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://pokeapi.co/api/v2/',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        responseType: ResponseType.json,
        headers: {'Content-Type': 'application/json'},
      ),
    );
  }

  // GET
  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      throw Exception(_handleError(e));
    }
  }

  // POST
  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      throw Exception(_handleError(e));
    }
  }

  // PUT
  Future<Response> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      throw Exception(_handleError(e));
    }
  }

  // DELETE
  Future<Response> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      throw Exception(_handleError(e));
    }
  }

  // Erro formatado
  String _handleError(DioException error) {
    if (error.type == DioExceptionType.connectionTimeout) {
      return 'Tempo de conexão esgotado';
    } else if (error.type == DioExceptionType.sendTimeout) {
      return 'Timeout ao enviar dados';
    } else if (error.type == DioExceptionType.receiveTimeout) {
      return 'Tempo de resposta esgotado';
    } else if (error.type == DioExceptionType.badResponse) {
      return 'Erro de servidor: ${error.response?.statusCode}';
    } else if (error.type == DioExceptionType.cancel) {
      return 'Requisição cancelada';
    } else {
      return 'Erro inesperado: ${error.message}';
    }
  }
}
