import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_articles/exceptions/http_exception.dart';
import 'package:flutter_articles/services/http/http_service.dart';

class DioHttpService implements HttpService {
  Dio get dio => Dio(baseOptions);

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
  Future<Response> get({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    log('Get Request to: ${dio.options.baseUrl + endpoint}\nparams: $queryParameters');

    Response response = await dio.get(
      endpoint,
      queryParameters: queryParameters,
    );

    if (response.data == null || response.statusCode != 200) {
      throw HttpException(
        title: 'Http Error!',
        statusCode: response.statusCode,
        message: response.statusMessage,
      );
    }

    return response;
  }

  @override
  Future<Response> post({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    log('Get Request to: ${dio.options.baseUrl + endpoint}\nparams: $queryParameters');

    Response response = await dio.post(
      endpoint,
      queryParameters: queryParameters,
    );

    if (response.data == null || response.statusCode != 200) {
      throw HttpException(
        title: 'Http Error!',
        statusCode: response.statusCode,
        message: response.statusMessage,
      );
    }

    return response;
  }

  @override
  Future delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future put() {
    // TODO: implement put
    throw UnimplementedError();
  }
}
