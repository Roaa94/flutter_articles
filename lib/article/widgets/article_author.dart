import 'package:flutter/material.dart';
import 'package:flutter_articles/models/article.dart';
import 'package:flutter_articles/presentation/shared/app_cached_network_image.dart';
import 'package:flutter_articles/presentation/styles/app_colors.dart';

class ArticleAuthor extends StatelessWidget {
  final Article article;

  const ArticleAuthor(this.article, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 17, right: 17, bottom: 20),
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
