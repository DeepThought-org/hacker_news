import 'package:hacker_news/data/repository/hacker_news_repository.dart';
import 'package:hacker_news/domain/model/hacker_news.dart';

abstract class HackerNewsService {
  Future<List<HackerNews>> topNewsList();
}

class HackerNewsServiceImpl implements HackerNewsService {
  HackerNewsServiceImpl(this._hackerNewsRepository);

  final HackerNewsRepository _hackerNewsRepository;

  @override
  Future<List<HackerNews>> topNewsList() async {
    final topStoryIds = await _hackerNewsRepository.topStoryIds();
    final futures = topStoryIds.map((id) => _hackerNewsRepository.newsById(id));
    return Future.wait(futures);
  }
}
