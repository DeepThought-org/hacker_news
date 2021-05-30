import 'package:get_it/get_it.dart';
import 'package:hacker_news/data/data_source/local_hacker_news_data_source.dart';
import 'package:hacker_news/data/data_source/remote_hacker_news_data_source.dart';
import 'package:hacker_news/data/repository/hacker_news_repository.dart';
import 'package:hacker_news/domain/exception/http_exception_describer.dart';
import 'package:hacker_news/domain/service/hacker_news_service.dart';
import 'package:hacker_news/domain/use_case/get_top_news_list_use_case.dart';
import 'package:hacker_news/presentation/ui/top_news/top_news_cubit.dart';

final getIt = GetIt.instance;

void initializeGetIt() {
  /**
   * Data
   */
  getIt.registerLazySingleton<LocalHackerNewsDataSource>(
      () => LocalHackerNewsDataSourceImpl());
  getIt.registerFactory<RemoteHackerNewsDataSource>(
      () => RemoteHackerNewsDataSourceImpl());

  getIt.registerFactory<HackerNewsRepository>(
      () => HackerNewsRepositoryImpl(getIt(), getIt()));

  /**
   * Domain
   */
  getIt.registerFactory<HackerNewsService>(
      () => HackerNewsServiceImpl(getIt(), getIt()));

  getIt.registerLazySingleton(() => HttpExceptionDescriber());
  getIt.registerFactory(() => GetTopNewsListUseCase(getIt()));

  /**
   * Presentation
   */
  getIt.registerFactory(() => TopNewsCubit(getIt()));
}
