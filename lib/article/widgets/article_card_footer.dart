import 'package:flutter/material.dart';
import 'package:flutter_articles/models/article.dart';
import 'package:flutter_articles/presentation/shared/app_cached_network_image.dart';
import 'package:flutter_articles/presentation/styles/app_colors.dart';

class ArticleCardFooter extends StatelessWidget {
  final Article article;

  const ArticleCardFooter(this.article, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.3),
        borderRadius: const BorderRadius.only(bottomRight: Radius.circular(15), bottomLeft: Radius.circular(15)),
      ),
      child: Row(
        children: [
          if (article.author?.profileImage90 != null)
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: AppCachedNetworkImage(
                  imageUrl: article.author!.profileImage90!,
                  width: 40,
                  height: 40,
                ),
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.primary, width: 2),
              ),
            ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (article.author?.name != null)
                  Text(
                    article.author!.name,
                    style: const TextStyle(fontSize: 18),
                  ),
                Text(article.readablePublishDate),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
