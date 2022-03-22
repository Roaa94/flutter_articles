import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_articles/article/widgets/articles_list.dart';
import 'package:flutter_articles/models/article.dart';
import 'package:flutter_articles/presentation/shared/app_bar_flutter_logo.dart';
import 'package:flutter_articles/repositories/article_repository.dart';
import 'package:provider/provider.dart';

class RawHomePage extends StatefulWidget {
  const RawHomePage({Key? key}) : super(key: key);

  @override
  State<RawHomePage> createState() => _HomePageState();
}

class _HomePageState extends State<RawHomePage> {
  final StreamController<List<Article>> streamController =
      StreamController<List<Article>>();
  late HttpArticleRepository articleRepository;

  Future<void> _getArticles() async {
    try {
      List<Article> articles =
          await articleRepository.getArticles(tags: ['flutter', 'dart']);
      streamController.add(articles);
    } catch (e) {
      streamController.addError(e);
      rethrow;
    }
  }

  @override
  void initState() {
    articleRepository =
        Provider.of<HttpArticleRepository>(context, listen: false);
    _getArticles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Articles'),
        actions: const [AppBarFlutterLogo()],
      ),
      body: RefreshIndicator(
        onRefresh: _getArticles,
        child: StreamBuilder<List<Article>>(
          stream: streamController.stream,
          builder:
              (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
            if (snapshot.hasError) {
              return const Center(child: Text('An Error Occurred!'));
            } else {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const Center(child: CircularProgressIndicator());
                case ConnectionState.active:
                case ConnectionState.done:
                  if (!snapshot.hasData ||
                      (snapshot.data is List &&
                          (snapshot.data as List).isEmpty)) {
                    return const Center(child: Text('No Data'));
                  } else {
                    return ArticlesList(snapshot.data!);
                  }
                case ConnectionState.none:
                default:
                  return const Text('No Data');
              }
            }
          },
        ),
      ),
    );
  }
}
