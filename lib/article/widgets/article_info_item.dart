import 'package:flutter/material.dart';

class ArticleInfoItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const ArticleInfoItem({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 14,
          color: Theme.of(context).textTheme.bodyText2!.color!.withOpacity(0.5),
        ),
        const SizedBox(width: 5),
        Text(
          text,
          style: TextStyle(color: Theme.of(context).textTheme.bodyText2!.color!.withOpacity(0.5)),
        ),
      ],
    );
  }
}
