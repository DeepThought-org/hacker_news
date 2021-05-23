import 'package:hacker_news/data/cache/hacker_news_cache.dart';
import 'package:hacker_news/domain/model/hacker_news.dart';
import 'package:hacker_news/domain/modeling/primitive/not_empty_string.dart';
import 'package:hacker_news/domain/modeling/primitive/positive_integer.dart';

extension HackerNewsCacheMapper on HackerNewsCache {
  HackerNews toHackerNews() => HackerNews(
        PositiveInteger(id),
        NotEmptyString(title),
        Uri.parse(url),
      );
}
