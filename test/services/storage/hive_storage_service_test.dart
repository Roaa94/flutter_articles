import 'package:flutter_articles/services/storage/storage_service.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mock_service_locator.dart';

void main() {
  group('Hive Storage Service Test', () {
    late StorageService mockStorageService;

    setUp(() async {
      setUpMockServiceLocator();
      mockStorageService = getMocks<StorageService>();
      await mockStorageService.init();
    });

    test('Can store & get value', () async {
      mockStorageService.set(StorageKeys.test, 'someValue');

      expect(mockStorageService.get(StorageKeys.test), 'someValue');
    });

    test('Can check if key exists', () async {
      mockStorageService.set(StorageKeys.test, 'someValue');
      expect(mockStorageService.has(StorageKeys.test), true);

      mockStorageService.remove(StorageKeys.test);
      expect(mockStorageService.has(StorageKeys.test), false);
    });

    test('Can delete value', () async {
      mockStorageService.set(StorageKeys.test, 'someValue');
      mockStorageService.remove(StorageKeys.test);

      expect(mockStorageService.get(StorageKeys.test), null);
    });

    test('Can get all values', () async {
      mockStorageService.set(StorageKeys.test, 'someValue');
      mockStorageService.set('test2', 'otherValue');

      expect(mockStorageService.getAll(), ['someValue', 'otherValue']);
    });

    test('Can clear all values', () async {
      mockStorageService.set(StorageKeys.test, 'someValue');
      mockStorageService.set('test2', 'otherValue');
      await mockStorageService.clear();

      expect(mockStorageService.getAll(), []);
    });

    tearDown(() async {
      await mockStorageService.close();
      await resetMockServiceLocator();
    });
  });
}
