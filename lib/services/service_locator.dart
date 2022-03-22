import 'package:flutter_articles/services/http/dio_http_service.dart';
import 'package:flutter_articles/services/http/http_service.dart';
import 'package:flutter_articles/services/storage/hive_storage_service.dart';
import 'package:flutter_articles/services/storage/storage_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

setupServiceLocator() {
  getIt.registerSingleton<StorageService>(HiveStorageService());

  final StorageService storageService = getIt<StorageService>();

  getIt.registerSingleton<HttpService>(DioHttpService(storageService));
}

Future resetServiceLocator() async {
  await getIt.reset();
}
