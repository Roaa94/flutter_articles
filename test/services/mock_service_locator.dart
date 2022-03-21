import 'package:flutter_articles/services/http/http_service.dart';
import 'package:get_it/get_it.dart';

import 'http/mock_dio_http_service.dart';

final getMocks = GetIt.instance;

void setUpMockServiceLocator() {
  getMocks.registerSingleton<HttpService>(MockDioHttpService());
}

Future resetMockServiceLocator() async {
  await getMocks.reset();
}
