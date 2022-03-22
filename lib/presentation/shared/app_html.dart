import 'package:flutter/material.dart';
import 'package:flutter_articles/presentation/styles/app_colors.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class AppHtml extends StatelessWidget {
  final String? data;

  const AppHtml({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
        child: data == null
            ? Container()
            : HtmlWidget(
                data!,
                buildAsync: false,
                renderMode: RenderMode.column,
                enableCaching: false,
                textStyle: const TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: AppColors.secondary,
                  height: 1.2,
                ),
              ),
      ),
    );
  }
}
