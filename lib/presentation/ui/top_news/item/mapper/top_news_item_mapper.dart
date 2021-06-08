import 'package:hacker_news/domain/model/hacker_news.dart';
import 'package:hacker_news/presentation/ui/top_news/item/top_news_item.dart';

extension TopNewsItemMapper on HackerNews {
  TopNewsItem toItem() => TopNewsItem(
        id.value() ?? -1,
        title.value() ?? "(제목 없음)",
        url,
      );
}
