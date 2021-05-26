import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_news/data/dto/hacker_news_story_dto.dart';
import 'package:hacker_news/domain/exception/http_exception_describer.dart';
import 'package:hacker_news/domain/model/hacker_news.dart';
import 'package:hacker_news/domain/use_case/get_top_news_list_use_case.dart';
import 'package:hacker_news/presentation/ui/top_news/top_news_cubit.dart';
import 'package:hacker_news/presentation/ui/top_news/top_news_state.dart';
import 'package:hacker_news/data/dto/mapper/hacker_news_dto_mapper.dart';
import 'package:hacker_news/presentation/ui/top_news/item/mapper/top_news_item_mapper.dart';

import '../common/test_data_reader.dart';
import '../mock/mock_hacker_news_service.dart';

void main() {
  late MockHackerNewsService hackerNewsService;
  late HttpExceptionDescriber httpExceptionDescriber;
  late TopNewsCubit cubit;

  late List<HackerNews> hackerNewsList;

  setUp(() {
    hackerNewsService = MockHackerNewsService();
    httpExceptionDescriber = HttpExceptionDescriber();

    hackerNewsList = readTestData("hacker_news_story",
        (e) => HackerNewsStoryDto.fromJson(e).toHackerNews());

    cubit = TopNewsCubit(GetTopNewsListUseCase(
      hackerNewsService,
      httpExceptionDescriber,
    ));
  });

  blocTest<TopNewsCubit, TopNewsState>(
    'when get top news list succeed, emit loaded state',
    build: () {
      hackerNewsService.hackerNewsList = hackerNewsList;
      return cubit;
    },
    act: (cubit) {
      cubit.loadTopNews();
    },
    expect: () {
      final mapped = hackerNewsList.map((e) => e.toItem()).toList();
      return [TopNewsLoadingState(), TopNewsLoadedState(mapped)];
    },
  );
}
