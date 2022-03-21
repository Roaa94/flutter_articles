import 'package:dio/dio.dart';
import 'package:flutter_articles/services/http/dio_http_service.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import '../../dummy-data/dummy_articles.dart';

class MockDioHttpService extends DioHttpService {
  DioAdapter dioAdapter = DioAdapter(
    dio: Dio(
      DioHttpService().baseOptions.copyWith(baseUrl: 'https://api.test/'),
    ),
  );

  MockDioHttpService() {
    registerMockRequests(dioAdapter);
  }

  @override
  Dio get dio => dioAdapter.dio;
}

class MockRequest {
  final String route;
  final int statusCode;
  final dynamic responseData;
  final Map<String, dynamic>? queryParameters;

  MockRequest({
    required this.route,
    required this.statusCode,
    required this.responseData,
    this.queryParameters,
  });
}

List<MockRequest> mockGetRequests = [
  MockRequest(
    statusCode: 200,
    route: 'get-request-test',
    responseData: {'message': 'Success!'},
  ),
  MockRequest(
    statusCode: 200,
    route: 'successful-get-request-test',
    responseData: {'message': 'Success!'},
  ),
  MockRequest(
    statusCode: 404,
    route: '404-get-request-test',
    responseData: {'error': '404 Error!'},
  ),
  MockRequest(
    statusCode: 200,
    route: 'articles',
    queryParameters: {
      'tag': 'flutter, dart',
    },
    responseData: DummyArticles.rawArticlesIndexResponse,
  ),
  MockRequest(
    statusCode: 200,
    route: 'articles',
    queryParameters: {'username': 'aqueel'},
    responseData: DummyArticles.rawAuthorArticlesResponse,
  ),
  MockRequest(
    statusCode: 200,
    route: 'article/${DummyArticles.rawArticleDetails['id']}',
    responseData: DummyArticles.rawArticleDetails,
  ),
];

List<MockRequest> mockPostRequests = [
  MockRequest(
    statusCode: 200,
    route: 'successful-post-request-test',
    responseData: {'message': 'Success!'},
  ),
  MockRequest(
    statusCode: 404,
    route: '404-post-request-test',
    responseData: {'error': '404 Error!'},
  ),
];

void registerMockRequests(DioAdapter dioAdapter) {
  for (MockRequest request in mockGetRequests) {
    dioAdapter.onGet(
      request.route,
      (server) => server.reply(request.statusCode, request.responseData),
      queryParameters: request.queryParameters,
    );
  }

  for (MockRequest request in mockPostRequests) {
    dioAdapter.onPost(
      request.route,
      (server) => server.reply(request.statusCode, request.responseData),
    );
  }
}
