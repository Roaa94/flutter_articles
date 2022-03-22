import 'package:flutter/material.dart';
import 'package:flutter_articles/presentation/article/widgets/article_info_item.dart';
import 'package:flutter_articles/models/article.dart';
import 'package:flutter_articles/presentation/styles/app_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ArticleInfo extends StatelessWidget {
  final Article article;
  final bool isMin;

  const ArticleInfo(this.article, {Key? key, this.isMin = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 17, vertical: isMin ? 10 : 20),
      decoration: BoxDecoration(
        border: isMin
            ? null
            : Border(
                bottom: BorderSide(
                    width: 0.5,
                    color: Theme.of(context).dividerColor.withOpacity(0.3)),
              ),
        color: isMin
            ? Theme.of(context).brightness == Brightness.light
                ? AppColors.grayLight
                : AppColors.white.withOpacity(0.2)
            : null,
      ),
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
