import 'package:hacker_news/data/repository/hacker_news_repository.dart';
import 'package:hacker_news/domain/exception/http_exception_describer.dart';
import 'package:hacker_news/domain/model/hacker_news.dart';

class GetTopNewsListUseCase {
  GetTopNewsListUseCase(this._hackerNewsRepository, this._exceptionDescriber);

  final HackerNewsRepository _hackerNewsRepository;
  final HttpExceptionDescriber _exceptionDescriber;

  Future<List<HackerNews>> call() async {
    try {
      final topStoryIds = await _hackerNewsRepository.topStoryIds();
      final futures = topStoryIds.map((id) => _hackerNewsRepository.newsById(id));
      return Future.wait(futures);
    } on Exception catch(e) {
      throw _exceptionDescriber.describe(e);
    }
  }
}
