import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:hacker_news/di/get_it.dart';
import 'package:hacker_news/presentation/ui/top_news/top_news_page.dart';
import 'package:hacker_news/presentation/ui/top_news_detail/top_news_detail_page.dart';
import 'package:thought_design_system/element/theme.dart';

void main() {
  initializeGetIt();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final delegate = BeamerDelegate(
    locationBuilder: SimpleLocationBuilder(
      routes: {
        '/topnews': (_, __) => BeamPage(
              title: 'TopNews',
              child: TopNewsPage(),
              key: ValueKey('topnews'),
            ),
        '/topnews/:id': (_, state) {
          final id = state.pathParameters['id'];
          return BeamPage(
            title: 'TopNews',
            child: TopNewsDetailPage(topNewsId: id),
            key: ValueKey('topnews-$id'),
          );
        }
      },
    ),
    initialPath: '/topnews'
  );

  @override
  Widget build(BuildContext context) {
    return ThoughtApp(routerDelegate: delegate);
  }
}
