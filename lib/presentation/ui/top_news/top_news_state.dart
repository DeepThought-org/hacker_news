import 'package:hacker_news/presentation/ui/top_news/item/top_news_item.dart';

class TopNewsState {
  TopNewsState();

  factory TopNewsState.loaded(List<TopNewsItem> topNewsList) =>
      TopNewsLoadedState(topNewsList);

  factory TopNewsState.loading() = TopNewsLoadingState;

  factory TopNewsState.error(String message) =>
      TopNewsErrorState(message);
}

class TopNewsLoadedState extends TopNewsState {
  TopNewsLoadedState(this.topNewsList);

  final List<TopNewsItem> topNewsList;
}

class TopNewsLoadingState extends TopNewsState {}

class TopNewsErrorState extends TopNewsState {
  TopNewsErrorState(this.message);

  final String message;
}
