import 'package:hacker_news/data/dto/hacker_news_dto.dart';
import 'package:hacker_news/domain/model/hacker_news.dart';
import 'package:hacker_news/domain/modeling/primitive/not_empty_string.dart';
import 'package:hacker_news/domain/modeling/primitive/positive_integer.dart';

extension HackerNewsDtoMapper on HackerNewsDto {
  HackerNews toHackerNews() => HackerNews(
        PositiveInteger(id),
        NotEmptyString(title),
        url == null ? null : Uri.parse(url!),
      );
}
