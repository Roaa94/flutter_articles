import 'package:dio/dio.dart';
import 'package:flutter_articles/services/http/dio_http_service.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

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
  final Map<String, dynamic> response;

  MockRequest({
    required this.route,
    required this.statusCode,
    required this.response,
  });
}

List<MockRequest> mockGetRequests = [
  MockRequest(
    statusCode: 200,
    route: 'get-request-test',
    response: {'message': 'Success!'},
  ),
  MockRequest(
    statusCode: 200,
    route: 'successful-get-request-test',
    response: {'message': 'Success!'},
  ),
  MockRequest(
    statusCode: 404,
    route: '404-get-request-test',
    response: {'error': '404 Error!'},
  ),
];

List<MockRequest> mockPostRequests = [
  MockRequest(
    statusCode: 200,
    route: 'successful-post-request-test',
    response: {'message': 'Success!'},
  ),
  MockRequest(
    statusCode: 404,
    route: '404-post-request-test',
    response: {'error': '404 Error!'},
  ),
];

void registerMockRequests(DioAdapter dioAdapter) {
  for (MockRequest request in mockGetRequests) {
    dioAdapter.onGet(
      request.route,
      (server) => server.reply(request.statusCode, request.response),
    );
  }

  for (MockRequest request in mockPostRequests) {
    dioAdapter.onPost(
      request.route,
      (server) => server.reply(request.statusCode, request.response),
    );
  }
}
