import 'package:flutter/material.dart';
import 'package:flutter_articles/article/widgets/articles_list.dart';
import 'package:flutter_articles/models/article.dart';
import 'package:flutter_articles/presentation/shared/app_bar_flutter_logo.dart';
import 'package:flutter_articles/presentation/shared/http_page_wrapper.dart';
import 'package:flutter_articles/repositories/article_repository.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HttpArticleRepository articleRepository =
        Provider.of<HttpArticleRepository>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Articles'),
        actions: const [AppBarFlutterLogo()],
      ),
      body: HttpPageWrapper<List<Article>>(
        dataRequest: (bool forceRefresh) async {
          return await articleRepository.getArticles(
            tags: ['flutter', 'dart'],
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
