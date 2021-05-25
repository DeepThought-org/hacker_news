import 'package:hacker_news/data/dto/hacker_news_story_dto.dart';
import 'package:hacker_news/data/exception/http_exception.dart';
import 'package:hacker_news/data/repository/hacker_news_repository.dart';
import 'package:hacker_news/domain/model/hacker_news.dart';
import 'package:hacker_news/data/dto/mapper/hacker_news_dto_mapper.dart';

class MockHackerNewsRepository extends HackerNewsRepository {
  List<HackerNewsStoryDto> hackerNewsList = [];
  List<int> topStoryIdsList = [];

  HttpException? shouldBeThrown;

  @override
  Future<HackerNews> newsById(int id) async {
    if (shouldBeThrown != null) {
      throw shouldBeThrown!;
    }
    return hackerNewsList
        .firstWhere((element) => element.id == id)
        .toHackerNews();
  }

  @override
  Future<List<int>> topStoryIds() async {
    if (shouldBeThrown != null) {
      throw shouldBeThrown!;
    }
    return topStoryIdsList;
  }
}
