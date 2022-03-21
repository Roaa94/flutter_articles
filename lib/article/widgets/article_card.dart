import 'package:flutter/material.dart';
import 'package:flutter_articles/article/widgets/article_card_footer.dart';
import 'package:flutter_articles/article/widgets/article_cover_image.dart';
import 'package:flutter_articles/article/widgets/article_info.dart';
import 'package:flutter_articles/article/widgets/article_tags.dart';
import 'package:flutter_articles/models/article.dart';
import 'package:flutter_articles/presentation/styles/app_colors.dart';

class ArticleCard extends StatelessWidget {
  final Article article;

  const ArticleCard(this.article, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(width: 1, color: Theme.of(context).dividerColor.withOpacity(0.5)),
        boxShadow: [BoxShadow(blurRadius: 8, color: AppColors.secondary.withOpacity(0.1))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (article.coverImage != null) ArticleCoverImage(article.coverImage!),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.title,
                  style: Theme.of(context).textTheme.headline5,
                  textAlign: TextAlign.start,
                ),
                Text(article.description),
              ],
            ),
          ),
          const SizedBox(height: 10),
          ArticleTags(tags: article.tags),
          ArticleInfo(article),
          ArticleCardFooter(article),
        ],
      ),
    );
  }
}
