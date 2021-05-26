import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_news/domain/exception/described_exception.dart';
import 'package:hacker_news/domain/use_case/get_top_news_list_use_case.dart';
import 'package:hacker_news/presentation/ui/top_news/top_news_state.dart';
import 'package:hacker_news/presentation/ui/top_news/item/mapper/top_news_item_mapper.dart';

class TopNewsCubit extends Cubit<TopNewsState> {
  TopNewsCubit(this._getTopNewsListUseCase) : super(TopNewsState.loading()) {
    loadTopNews();
  }

  final GetTopNewsListUseCase _getTopNewsListUseCase;

  void loadTopNews() async {
    emit(TopNewsState.loading());
    try {
      final topNews = await _getTopNewsListUseCase();
      final mapped = topNews.map((e) => e.toItem()).toList();
      emit(TopNewsState.loaded(mapped));
    } on DescribedException catch (e) {
      emit(TopNewsState.error(e.message));
    }
  }
}
