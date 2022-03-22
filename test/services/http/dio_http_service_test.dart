import 'package:dio/dio.dart';
import 'package:flutter_articles/exceptions/http_exception.dart';
import 'package:flutter_articles/services/http/dio_http_service.dart';
import 'package:flutter_articles/services/http/http_service.dart';
import 'package:flutter_articles/services/storage/storage_service.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mock_service_locator.dart';
import 'mock_dio_http_service.dart';

void main() {
  group('DioHttpService tests', () {
    late HttpService mockHttpService;

    setUp(() {
      setUpMockServiceLocator();
      mockHttpService = getMocks<HttpService>();
    });

    test('Returns correct Dio client', () async {
      final Response response = await mockHttpService.get('successful-get-request-test');
      StorageService mockStorageService = getMocks<StorageService>();
      expect(
        response.requestOptions.baseUrl,
        equals(MockDioHttpService(mockStorageService).dio.options.baseUrl),
      );

      expect(
        response.requestOptions.baseUrl,
        isNot(DioHttpService(mockStorageService).dio.options.baseUrl),
      );
    });

    test('Successful Get Request', () async {
      final Response response = await mockHttpService.get('successful-get-request-test');

      expect(response.statusCode, 200);
      expect(response.data, {'message': 'Success!'});
    });

    test('404 Get Request', () async {
      expectLater(() async => await mockHttpService.get('404-get-request-test'), throwsA(isA<HttpException>()));

      try {
        await mockHttpService.get('404-get-request-test');
      } on HttpException catch (e) {
        expect(e.title, 'Http Error!');
        expect(e.statusCode, 404);
      }
    });

    test('Successful Post Request', () async {
      final Response response = await mockHttpService.post('successful-post-request-test');

      expect(response.statusCode, 200);
      expect(response.data, {'message': 'Success!'});
    });

    test('404 Post Request', () async {
      expectLater(() async => await mockHttpService.post('404-post-request-test'), throwsA(isA<HttpException>()));

      try {
        await mockHttpService.post('404-post-request-test');
      } on HttpException catch (e) {
        expect(e.title, 'Http Error!');
        expect(e.statusCode, 404);
      }
    });

    test('Unimplemented methods', () async {
      expect(() async => await mockHttpService.delete(), throwsA(isA<UnimplementedError>()));
      expect(() async => await mockHttpService.put(), throwsA(isA<UnimplementedError>()));
    });

    tearDown(() async {
      await resetMockServiceLocator();
    });
  });
}
