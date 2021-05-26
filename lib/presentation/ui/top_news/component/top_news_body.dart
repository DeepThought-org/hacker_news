import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_news/presentation/ui/top_news/component/top_news_empty_body.dart';
import 'package:hacker_news/presentation/ui/top_news/component/top_news_error_body.dart';
import 'package:hacker_news/presentation/ui/top_news/component/top_news_loaded_body.dart';
import 'package:hacker_news/presentation/ui/top_news/component/top_news_loading_body.dart';
import 'package:hacker_news/presentation/ui/top_news/top_news_cubit.dart';
import 'package:hacker_news/presentation/ui/top_news/top_news_state.dart';

class TopNewsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<TopNewsCubit>();
    switch (cubit.state.runtimeType) {
      case TopNewsLoadingState:
        return TopNewsLoadingBody();
      case TopNewsErrorState:
        return TopNewsErrorBody();
      case TopNewsLoadedState:
        return TopNewsLoadedBody(
            (cubit.state as TopNewsLoadedState).topNewsList);
      case TopNewsEmptyState:
        return TopNewsEmptyBody();
      default:
        return TopNewsLoadingBody();
    }
  }
}
