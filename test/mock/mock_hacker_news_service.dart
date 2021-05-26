import 'package:hacker_news/data/exception/http_exception.dart';
import 'package:hacker_news/domain/model/hacker_news.dart';
import 'package:hacker_news/domain/service/hacker_news_service.dart';

class MockHackerNewsService implements HackerNewsService {
  List<HackerNews> hackerNewsList = [];

  HttpException? shouldBeThrown;

  @override
  Future<List<HackerNews>> topNewsList() async {
    if (shouldBeThrown != null) {
      throw shouldBeThrown!;
    }
    return hackerNewsList;
  }
}