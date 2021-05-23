import 'package:hacker_news/data/cache/hacker_news_cache.dart';

abstract class LocalHackerNewsDataSource {
  HackerNewsCache? newsById(int id);

  void cacheNews(HackerNewsCache news);
}

class LocalHackerNewsDataSourceImpl implements LocalHackerNewsDataSource {
  Map<int, HackerNewsCache> cachedIdAndNews = Map();

  @override
  HackerNewsCache? newsById(int id) {
    final cached = cachedIdAndNews[id];
    return (cached != null && cached.expired) ? cached : null;
  }

  @override
  void cacheNews(HackerNewsCache news) {
    cachedIdAndNews[news.id] = news;
  }
}
