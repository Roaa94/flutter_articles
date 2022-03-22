import 'package:flutter_articles/services/storage/hive_storage_service.dart';
import 'package:hive_test/hive_test.dart';

class MockHiveStorageService extends HiveStorageService {
  @override
  Future<void> init() async {
    await setUpTestHive();
    await openBox();
  }

  @override
  Future<void> close() async {
    await tearDownTestHive();
  }
}
