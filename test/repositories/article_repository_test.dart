import 'package:flutter_articles/models/article.dart';
import 'package:flutter_articles/repositories/article_repository.dart';
import 'package:flutter_articles/services/http/http_service.dart';
import 'package:flutter_test/flutter_test.dart';

import '../dummy-data/dummy_articles.dart';
import '../services/mock_service_locator.dart';

void main() {
  group('ArticleRepository tests', () {
    late HttpService mockHttpService;
    late HttpArticleRepository articleRepository;

    setUp(() {
      setUpMockServiceLocator();
      mockHttpService = getMocks<HttpService>();
      articleRepository = HttpArticleRepository(mockHttpService);
    });

    group('Article Index Requests', () {
      test('Returns articles with correct tags', () async {
        List<Article> articles = await articleRepository.getArticles(tags: ['flutter', 'dart']);

        expect(articles, equals(DummyArticles.articlesIndexResponse));

        for (Article article in articles) {
          expect(article.tags.contains('flutter'), isTrue);
          expect(article.tags.contains('dart'), isTrue);
        }
      });

      test('Returns articles of username', () async {
        List<Article> authorArticles = await articleRepository.getArticles(username: 'aqueel');

        expect(authorArticles, equals(DummyArticles.authorArticlesResponse));

        for (Article article in authorArticles) {
          expect(article.author?.username, 'aqueel');
        }
      });
    });

    group('Article Show Requests', () {
      test('Returns detailed article', () async {
        Article article = await articleRepository.getArticle(id: DummyArticles.articleDetails.id);

        expect(article, DummyArticles.articleDetails);
        expect(article.bodyHtml, isNotNull);
        expect(article.bodyMarkdown, isNotNull);
        expect(article.author, isNotNull);
      });
    });

    tearDown(() async {
      await resetMockServiceLocator();
    });
  });
}
