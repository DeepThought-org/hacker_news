import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_news/di/get_it.dart';
import 'package:hacker_news/presentation/ui/top_news/component/top_news_body.dart';
import 'package:hacker_news/presentation/ui/top_news/top_news_cubit.dart';
import 'package:thought_design_system/component/thought_scaffold.dart';
import 'package:thought_design_system/component/thought_toolbar.dart';

class TopNewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt.get<TopNewsCubit>(),
      child: ThoughtScaffold(
        body: Column(children: [
          ThoughtToolbar(title: "HackerNews"),
          TopNewsBody(),
        ]),
      ),
    );
  }
}
