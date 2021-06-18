import 'dart:async';

import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:hacker_news/di/get_it.dart';
import 'package:hacker_news/presentation/ui/top_news/top_news_page.dart';
import 'package:hacker_news/presentation/ui/top_news_detail/top_news_detail_page.dart';
import 'package:thought_design_system/element/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeGetIt();
  await Firebase.initializeApp();

  runZonedGuarded(() {
    runApp(MyApp());
  }, FirebaseCrashlytics.instance.recordError);
}

class MyApp extends StatelessWidget {
  final delegate = BeamerDelegate(
      locationBuilder: SimpleLocationBuilder(
        routes: {
          '/topnews': (_, __) =>
              BeamPage(
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
