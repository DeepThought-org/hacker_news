import 'package:hacker_news/data/data_source/local_hacker_news_data_source.dart';
import 'package:hacker_news/data/data_source/remote_hacker_news_data_source.dart';
import 'package:hacker_news/data/cache/mapper/hacker_news_cache_mapper.dart';
import 'package:hacker_news/data/dto/mapper/hacker_news_dto_mapper.dart';
import 'package:hacker_news/domain/model/hacker_news.dart';

abstract class HackerNewsRepository {
  Future<List<int>> topStoryIds();

  Future<HackerNews> newsById(int id);
}

class HackerNewsRepositoryImpl implements HackerNewsRepository {
  HackerNewsRepositoryImpl(this._remoteDataSource, this._localDataSource);

  final RemoteHackerNewsDataSource _remoteDataSource;
  final LocalHackerNewsDataSource _localDataSource;

  @override
  Future<HackerNews> newsById(int id) {
    final cached = _localDataSource.newsById(id);
    return cached != null
        ? Future.value(cached.toHackerNews())
        : _remoteDataSource.newsById(id).then((dto) => dto.toHackerNews());
  }

  @override
  Future<List<int>> topStoryIds() {
    return _remoteDataSource.topStoryIds();
  }
}
