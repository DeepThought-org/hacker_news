import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_news/data/data_source/local_hacker_news_data_source.dart';
import 'package:hacker_news/data/data_source/remote_hacker_news_data_source.dart';
import 'package:hacker_news/data/repository/hacker_news_repository.dart';
import 'package:hacker_news/domain/exception/http_exception_describer.dart';
import 'package:hacker_news/domain/use_case/get_top_news_list_use_case.dart';

void main() {
  group('test', () {
    test('one', () async {
      final response = await GetTopNewsListUseCase(
              HackerNewsRepositoryImpl(RemoteHackerNewsDataSourceImpl(),
                  LocalHackerNewsDataSourceImpl()),
              HttpExceptionDescriber())
          .call();
      print(response.map((e) => e.toString()).join(","));
    });
  });
}
