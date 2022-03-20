import 'package:flutter_articles/services/http/dio_http_service.dart';
import 'package:flutter_articles/services/http/http_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

setupServiceLocator() {
  getIt.registerSingleton<HttpService>(DioHttpService());
}
