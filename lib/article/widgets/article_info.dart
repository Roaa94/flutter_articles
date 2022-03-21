import 'package:flutter/material.dart';
import 'package:flutter_articles/article/widgets/article_info_item.dart';
import 'package:flutter_articles/models/article.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ArticleInfo extends StatelessWidget {
  final Article article;

  const ArticleInfo(this.article, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
      decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 0.5, color: Theme.of(context).dividerColor.withOpacity(0.3)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ArticleInfoItem(
            icon: FontAwesomeIcons.solidComment,
            text: '${article.commentsCount} Comments',
          ),
          ArticleInfoItem(
            icon: FontAwesomeIcons.solidHeart,
            text: '${article.positiveReactionsCount} Reactions',
          ),
          ArticleInfoItem(
            icon: FontAwesomeIcons.clock,
            text: '${article.readingTimeMinutes} Min',
          ),
        ],
      ),
    );
  }
}
