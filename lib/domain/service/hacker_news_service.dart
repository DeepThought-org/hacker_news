import 'package:hacker_news/data/repository/hacker_news_repository.dart';
import 'package:hacker_news/domain/exception/http_exception_describer.dart';
import 'package:hacker_news/domain/exception/http_exception_describer.dart';
import 'package:hacker_news/domain/model/hacker_news.dart';

abstract class HackerNewsService {
  Future<List<HackerNews>> topNewsList();
}

class HackerNewsServiceImpl implements HackerNewsService {
  HackerNewsServiceImpl(
    this._hackerNewsRepository,
    this._httpExceptionDescriber,
  );

  final HackerNewsRepository _hackerNewsRepository;
  final HttpExceptionDescriber _httpExceptionDescriber;

  @override
  Future<List<HackerNews>> topNewsList() async {
    try {
      final topStoryIds = await _hackerNewsRepository.topStoryIds();
      final futures =
          topStoryIds.map((id) => _hackerNewsRepository.newsById(id));
      return Future.wait(futures);
    } on Exception catch (e) {
      throw _httpExceptionDescriber.describe(e);
    }
  }
}
