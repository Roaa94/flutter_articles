import 'package:flutter/material.dart';
import 'package:flutter_articles/models/article.dart';
import 'package:flutter_articles/models/http_response.dart';
import 'package:flutter_articles/services/http/http_service.dart';

abstract class ArticleRepository {
  Future<List<Article>> getArticles({
    List<String>? tags,
    String? username,
    bool forceRefresh = false,
  });

  Future<Article> getArticle({required int id});
}

class HttpArticleRepository with ChangeNotifier implements ArticleRepository {
  final HttpService httpService;

  HttpArticleRepository(this.httpService);

  bool isOffline = false;

  @override
  Future<List<Article>> getArticles({
    List<String>? tags,
    String? username,
    bool forceRefresh = false,
  }) async {
    Map<String, dynamic> queryParameters = {};
    if (username != null) {
      queryParameters['username'] = username;
    } else {
      // Only add tags query param if the username is null
      // Because specifying the username with the tags gives priority to the tags
      // and doesn't return only the username's articles
      queryParameters['tag'] = tags?.join(', ');
    }

    final HttpResponse response = await httpService.get(
      'articles',
      queryParameters: queryParameters,
      forceRefresh: forceRefresh,
    );

    isOffline = response.isOffline;
    notifyListeners();

    return List<Article>.from(response.data.map((x) => Article.fromJson(x)));
  }

  @override
  Future<Article> getArticle({required int id, bool forceRefresh = false}) async {
    final response = await httpService.get(
      'articles/$id',
      forceRefresh: forceRefresh,
    );

    isOffline = response.isOffline;
    notifyListeners();

    return Article.fromJson(response.data);
  }
}
