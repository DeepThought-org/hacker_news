import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_news/presentation/ui/top_news/item/top_news_item.dart';
import 'package:hacker_news/presentation/ui/top_news/top_news_cubit.dart';
import 'package:hacker_news/presentation/ui/top_news/top_news_state.dart';

class TopNewsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<TopNewsCubit>();
    switch (cubit.state.runtimeType) {
      case TopNewsLoadingState:
        return _Loading();
      case TopNewsErrorState:
        return _Error();
      case TopNewsLoadedState:
        return _Loaded((cubit.state as TopNewsLoadedState).topNewsList);
      default:
        return _Loading();
    }
  }
}

class _Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Center(child: CircularProgressIndicator()));
  }
}

class _Error extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Center(child: Text("에러 발생!₩")));
  }
}

class _Loaded extends StatelessWidget {
  _Loaded(this._topNewsItem);

  final List<TopNewsItem> _topNewsItem;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (_, index) {
          final item = _topNewsItem[index];
          return ListTile(title: Text(item.title));
        },
        itemCount: _topNewsItem.length,
      ),
    );
  }
}
