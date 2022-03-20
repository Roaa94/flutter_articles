import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_articles/services/http/http_service.dart';

class DioHttpService implements HttpService {
  @visibleForTesting
  Dio? dio;

  @override
  String get baseUrl => 'https://dev.to/api/';

  @override
  Map<String, String> headers = {'accept': 'application/json', 'content-type': 'application/json'};

  BaseOptions get baseOptions => BaseOptions(
        baseUrl: baseUrl,
        validateStatus: (status) => true, // To handle errors manually rather than by Dio
        headers: headers,
      );

  @override
  Future<dynamic> get({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    if (queryParameters != null) {
      log('Request query parameters: $queryParameters');
    }

    Dio _dio = dio ?? Dio(baseOptions);
    log('Get Request to: ${_dio.options.baseUrl + endpoint}');

    try {
      Response response = await _dio.get(endpoint, queryParameters: queryParameters);
    } on DioError catch (_) {
      rethrow;
    }
  }

  @override
  Future<dynamic> post({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      if (queryParameters != null) {
        log('Request query parameters: $queryParameters');
      }

      Dio _dio = dio ?? Dio(baseOptions);
      log('Get Request to: ${_dio.options.baseUrl + endpoint}');

      Response response = await _dio.post(
        endpoint,
        queryParameters: queryParameters,
      );
    } on DioError catch (_) {
      rethrow;
    }
  }

  @override
  Future<dynamic> put() async {}

  @override
  Future<dynamic> delete() async {}
}
