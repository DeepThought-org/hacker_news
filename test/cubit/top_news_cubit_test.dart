import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_news/domain/exception/http_exception_describer.dart';
import 'package:hacker_news/domain/use_case/get_top_news_list_use_case.dart';
import 'package:hacker_news/presentation/ui/top_news/top_news_cubit.dart';
import 'package:hacker_news/presentation/ui/top_news/top_news_state.dart';

import '../mock/mock_hacker_news_repository.dart';

void main() {
  late MockHackerNewsRepository hackerNewsRepository;
  late HttpExceptionDescriber httpExceptionDescriber;
  late TopNewsCubit cubit;

  setUp(() {
    hackerNewsRepository = MockHackerNewsRepository();
    httpExceptionDescriber = HttpExceptionDescriber();
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
