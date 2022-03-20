import 'package:flutter_articles/models/article.dart';
import 'package:flutter_test/flutter_test.dart';

import '../dummy-data/dummy_articles.dart';

void main() {
  group('Article model tests', () {
    test('Supports Value Equality', () {
      expect(DummyArticles.exampleIndexArticle1, isNot(DummyArticles.exampleIndexArticle2));
    });

    test('fromJson returns correct model', () {
      expect(Article.fromJson(DummyArticles.rawExampleIndexArticle1), equals(DummyArticles.exampleIndexArticle1));
    });
  });
}