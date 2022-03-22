import 'package:flutter/material.dart';
import 'package:flutter_articles/article/widgets/article_card.dart';
import 'package:flutter_articles/models/article.dart';

class ArticlesList extends StatelessWidget {
  final List<Article> articles;

  const ArticlesList(this.articles, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 20),
      itemCount: articles.length,
      itemBuilder: (c, i) => ArticleCard(articles[i]),
    );
  }
}
