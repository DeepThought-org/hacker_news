import 'package:hacker_news/data/repository/hacker_news_repository.dart';
import 'package:hacker_news/domain/exception/http_exception_describer.dart';
import 'package:hacker_news/domain/model/hacker_news.dart';
import 'package:hacker_news/domain/service/hacker_news_service.dart';

class GetTopNewsListUseCase {
  GetTopNewsListUseCase(this._hackerNewsService, this._exceptionDescriber);

  final HackerNewsService _hackerNewsService;
  final HttpExceptionDescriber _exceptionDescriber;

  Future<List<HackerNews>> call() async {
    try {
      return _hackerNewsService.topNewsList();
    } on Exception catch (e) {
      throw _exceptionDescriber.describe(e);
    }
  }
}
