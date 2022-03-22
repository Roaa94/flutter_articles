import 'package:flutter_articles/services/http/http_service.dart';
import 'package:flutter_articles/services/storage/storage_service.dart';
import 'package:get_it/get_it.dart';

import 'http/mock_dio_http_service.dart';
import 'storage/mock_hive_storage_service.dart';

final getMocks = GetIt.instance;

void setUpMockServiceLocator() {
  getMocks.registerSingleton<StorageService>(MockHiveStorageService());
  final StorageService storageService = getMocks<StorageService>();
  getMocks.registerSingleton<HttpService>(MockDioHttpService(storageService));
}

Future resetMockServiceLocator() async {
  await getMocks.reset();
}
