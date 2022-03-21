import 'package:flutter/material.dart';
import 'package:flutter_articles/home/pages/home_page.dart';
import 'package:flutter_articles/presentation/styles/app_themes.dart';
import 'package:flutter_articles/repositories/article_repository.dart';
import 'package:flutter_articles/services/http/http_service.dart';
import 'package:flutter_articles/services/service_locator.dart';
import 'package:provider/provider.dart';

void main() {
  setupServiceLocator();
  final HttpService httpService = getIt<HttpService>();

  runApp(App(
    httpService: httpService,
  ));
}

class App extends StatelessWidget {
  final HttpService httpService;

  const App({
    Key? key,
    required this.httpService,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HttpArticleRepository(httpService),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Articles',
        debugShowCheckedModeBanner: false,
        theme: AppThemes.mainTheme(),
        themeMode: ThemeMode.system,
        darkTheme: AppThemes.mainTheme(isDark: true),
        home: const HomePage(),
      ),
    );
  }
}
