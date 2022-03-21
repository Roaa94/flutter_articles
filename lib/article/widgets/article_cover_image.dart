import 'package:flutter/material.dart';
import 'package:flutter_articles/presentation/shared/app_cached_network_image.dart';

class ArticleCoverImage extends StatelessWidget {
  final String url;

  const ArticleCoverImage(this.url, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(topRight: Radius.circular(13), topLeft: Radius.circular(13)),
      child: AppCachedNetworkImage(
        imageUrl: url,
        fit: BoxFit.cover,
        height: 150,
        width: double.infinity,
      ),
    );
  }
}
