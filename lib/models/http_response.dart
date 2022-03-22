class HttpResponse<T> {
  T data;
  bool isOffline;

  HttpResponse({
    required this.data,
    this.isOffline = false,
  });
}
