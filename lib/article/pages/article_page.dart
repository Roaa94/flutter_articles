import 'package:flutter/material.dart';
import 'package:flutter_articles/article/widgets/article_author.dart';
import 'package:flutter_articles/article/widgets/article_cover_image.dart';
import 'package:flutter_articles/article/widgets/article_info.dart';
import 'package:flutter_articles/article/widgets/article_tags.dart';
import 'package:flutter_articles/models/article.dart';
import 'package:flutter_articles/presentation/shared/app_html.dart';
import 'package:flutter_articles/presentation/shared/http_page_wrapper.dart';
import 'package:flutter_articles/repositories/article_repository.dart';
import 'package:provider/provider.dart';

class ArticlePage extends StatelessWidget {
  final int id;

  const ArticlePage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HttpArticleRepository articleRepository = Provider.of<HttpArticleRepository>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: HttpPageWrapper(
          dataRequest: (bool forceRefresh) async => await articleRepository.getArticle(
            id: id,
            forceRefresh: forceRefresh,
          ),
          contentBuilder: (BuildContext context, Article article) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (article.coverImage != null) ArticleCoverImage(article.coverImage!),
                  ArticleInfo(article, isMin: true),
                  ArticleAuthor(article),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
                    child: Text(
                      article.title,
                      style: Theme.of(context).textTheme.headline5,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  ArticleTags(tags: article.tags),
                  AppHtml(data: article.bodyHtml),
                  const SizedBox(height: 100),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
