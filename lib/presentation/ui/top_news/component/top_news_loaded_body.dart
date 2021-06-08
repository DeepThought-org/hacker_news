import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:hacker_news/presentation/ui/top_news/item/top_news_item.dart';

class TopNewsLoadedBody extends StatelessWidget {
  TopNewsLoadedBody(this._topNewsItem);

  final List<TopNewsItem> _topNewsItem;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (_, index) {
          final item = _topNewsItem[index];
          return ListTile(
            title: Text(item.title),
            onTap: () {
              context.beamToNamed('/topnews/${item.id}');
            },
          );
        },
        itemCount: _topNewsItem.length,
      ),
    );
  }
}
