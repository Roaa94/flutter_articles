import 'package:flutter_articles/services/http/http_service.dart';
import 'package:flutter_articles/services/service_locator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App Service Locator Tests', () {
    setUp(() {
      setupServiceLocator();
    });

    test('App service locator registers all services', () async {
      expect(getIt.isRegistered<HttpService>(), isTrue);
    });

    tearDown(() async {
      await resetServiceLocator();
    });
  });
}