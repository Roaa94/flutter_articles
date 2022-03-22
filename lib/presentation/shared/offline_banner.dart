import 'package:flutter/material.dart';
import 'package:flutter_articles/presentation/shared/http_page_wrapper.dart';
import 'package:flutter_articles/presentation/styles/app_colors.dart';
import 'package:flutter_articles/repositories/article_repository.dart';
import 'package:provider/provider.dart';

class OfflineBanner extends StatelessWidget {
  final RefreshCallback onRefresh;

  const OfflineBanner({
    Key? key,
    required this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<HttpArticleRepository, bool>(
      selector: (c, HttpArticleRepository articlesRepository) => articlesRepository.isOffline,
      builder: (c, bool isOffline, _) => isOffline
          ? GestureDetector(
              onTap: onRefresh,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.3),
                ),
                child: const Text(
                  'You are offline! Tap to try again',
                  textAlign: TextAlign.center,
                ),
              ),
            )
          : Container(),
    );
  }
}
