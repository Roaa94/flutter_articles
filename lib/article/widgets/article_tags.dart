import 'package:flutter/material.dart';
import 'package:flutter_articles/presentation/styles/app_colors.dart';

class ArticleTags extends StatelessWidget {
  final List<String> tags;

  const ArticleTags({Key? key, required this.tags}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      child: Wrap(
        spacing: 10,
        children: List.generate(
          tags.length,
          (index) => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '# ',
                style: Theme.of(context).textTheme.bodyText2!.copyWith(color: AppColors.primary),
              ),
              Text(tags[index])
            ],
          ),
        ),
      ),
    );
  }
}
