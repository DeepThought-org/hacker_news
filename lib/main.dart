import 'package:flutter/material.dart';
import 'package:hacker_news/di/get_it.dart';
import 'package:hacker_news/presentation/ui/top_news/top_news_page.dart';
import 'package:thought_design_system/element/theme.dart';

void main() {
  initializeGetIt();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThoughtApp(
      child: TopNewsPage(),
    );
  }
}
