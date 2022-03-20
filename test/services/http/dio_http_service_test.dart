import 'package:dio/dio.dart';
import 'package:flutter_articles/exceptions/http_exception.dart';
import 'package:flutter_articles/services/http/dio_http_service.dart';
import 'package:flutter_articles/services/http/http_service.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mock_service_locator.dart';
import 'mock_dio_http_service.dart';

void main() {
  group('DioHttpService tests', () {
    late HttpService httpService;

    setUp(() {
      setUpMockServiceLocator();
      httpService = getIt<HttpService>();
    });

    test('Returns correct Dio client', () async {
      final Response response = await httpService.get(endpoint: 'successful-get-request-test');

      expect(
        response.requestOptions.baseUrl,
        equals(MockDioHttpService().dio.options.baseUrl),
      );

      expect(
        response.requestOptions.baseUrl,
        isNot(DioHttpService().dio.options.baseUrl),
      );
    });

    test('Successful Get Request', () async {
      final Response response = await httpService.get(endpoint: 'successful-get-request-test');

      expect(response.statusCode, 200);
      expect(response.data, {'message': 'Success!'});
    });

    test('404 Get Request', () async {
      expectLater(() async => await httpService.get(endpoint: '404-get-request-test'), throwsA(isA<HttpException>()));

      try {
        await httpService.get(endpoint: '404-get-request-test');
      } on HttpException catch (e) {
        expect(e.title, 'Http Error!');
        expect(e.statusCode, 404);
      }
    });

    test('Successful Post Request', () async {
      final Response response = await httpService.post(endpoint: 'successful-post-request-test');

      expect(response.statusCode, 200);
      expect(response.data, {'message': 'Success!'});
    });

    test('404 Post Request', () async {
      expectLater(() async => await httpService.post(endpoint: '404-post-request-test'), throwsA(isA<HttpException>()));

      try {
        await httpService.post(endpoint: '404-post-request-test');
      } on HttpException catch (e) {
        expect(e.title, 'Http Error!');
        expect(e.statusCode, 404);
      }
    });

    test('Unimplemented methods', () async {
      expect(() async => await httpService.delete(), throwsA(isA<UnimplementedError>()));
      expect(() async => await httpService.put(), throwsA(isA<UnimplementedError>()));
    });

    tearDown(() async {
      await resetMockServiceLocator();
    });
  });
}
