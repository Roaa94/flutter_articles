import 'package:flutter/material.dart';
import 'package:flutter_articles/models/article.dart';
import 'package:flutter_articles/presentation/article/widgets/articles_list.dart';
import 'package:flutter_articles/presentation/shared/http_page_wrapper.dart';
import 'package:flutter_articles/repositories/article_repository.dart';
import 'package:provider/provider.dart';

class AuthorArticlesPage extends StatelessWidget {
  final String authorName;
  final String authorUsername;

  const AuthorArticlesPage({
    Key? key,
    required this.authorName,
    required this.authorUsername,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HttpArticleRepository articleRepository =
        Provider.of<HttpArticleRepository>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          authorName,
          style: const TextStyle(fontSize: 16),
        ),
      ),
      body: HttpPageWrapper<List<Article>>(
        dataRequest: (bool forceRefresh) async {
          return await articleRepository.getArticles(
            username: authorUsername,
            forceRefresh: forceRefresh,
          );
        },
        contentBuilder: (BuildContext context, List<Article> articles) {
          return ArticlesList(articles);
        },
      ),
    );
  }
}
