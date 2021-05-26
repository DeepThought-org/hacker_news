import 'package:equatable/equatable.dart';
import 'package:hacker_news/presentation/ui/top_news/item/top_news_item.dart';

class TopNewsState extends Equatable {
  TopNewsState();

  factory TopNewsState.loaded(List<TopNewsItem> topNewsList) =>
      TopNewsLoadedState(topNewsList);

  factory TopNewsState.loading() = TopNewsLoadingState;

  factory TopNewsState.error(String message) => TopNewsErrorState(message);

  factory TopNewsState.empty() = TopNewsEmptyState;

  @override
  List<Object?> get props => [];
}

class TopNewsLoadedState extends TopNewsState {
  TopNewsLoadedState(this.topNewsList);

  final List<TopNewsItem> topNewsList;

  @override
  List<Object?> get props => [topNewsList];
}

class TopNewsLoadingState extends TopNewsState {}

class TopNewsErrorState extends TopNewsState {
  TopNewsErrorState(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}

class TopNewsEmptyState extends TopNewsState {}
