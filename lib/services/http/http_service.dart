abstract class HttpService {
  String get baseUrl;

  Map<String, String> get headers;

  Future<dynamic> get({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
  });

  Future<dynamic> post({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
  });

  Future<dynamic> put();

  Future<dynamic> delete();
}
