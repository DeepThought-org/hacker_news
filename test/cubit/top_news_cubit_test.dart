import 'dart:convert';
import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_news/data/dto/hacker_news_story_dto.dart';
import 'package:hacker_news/domain/exception/http_exception_describer.dart';
import 'package:hacker_news/domain/use_case/get_top_news_list_use_case.dart';
import 'package:hacker_news/presentation/ui/top_news/top_news_cubit.dart';
import 'package:hacker_news/presentation/ui/top_news/top_news_state.dart';

import '../common/test_data_reader.dart';
import '../mock/mock_hacker_news_repository.dart';

void main() {
  late MockHackerNewsRepository hackerNewsRepository;
  late HttpExceptionDescriber httpExceptionDescriber;
  late TopNewsCubit cubit;

  late List<int> topStoryIdList;
  late List<HackerNewsStoryDto> storyList;

  setUp(() {
    hackerNewsRepository = MockHackerNewsRepository();
    httpExceptionDescriber = HttpExceptionDescriber();

    storyList = readTestData(
        "hacker_news_story", (e) => HackerNewsStoryDto.fromJson(e));
    topStoryIdList = readTestData("hacker_news_top_story_id", (e) => e as int);

    cubit = TopNewsCubit(GetTopNewsListUseCase(
      hackerNewsRepository,
      httpExceptionDescriber,
    ));
  });

  blocTest<TopNewsCubit, TopNewsState>(
    'when get top news list succeed, emit loaded state',
    build: () {
      return cubit;
    },
    act: (cubit) {
      cubit.loadTopNews();
    },
    expect: () {
      return [TopNewsLoadingState(), TopNewsLoadedState([])];
    },
  );
}
