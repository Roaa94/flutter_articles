import 'package:flutter_articles/models/author.dart';
import 'package:flutter_test/flutter_test.dart';

import '../dummy-data/dummy_authors.dart';

void main() {
  group('Article model tests', () {
    test('Supports Value Equality', () {
      expect(DummyAuthors.authorExample1, isNot(DummyAuthors.authorExample2));
    });

    test('fromJson returns correct model', () {
      expect(Author.fromJson(DummyAuthors.rawAuthorExample1), equals(DummyAuthors.authorExample1));
    });
  });
}
