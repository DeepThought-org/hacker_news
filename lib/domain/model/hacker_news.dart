import 'package:hacker_news/domain/modeling/primitive/not_empty_string.dart';
import 'package:hacker_news/domain/modeling/primitive/positive_integer.dart';

class HackerNews {
  HackerNews(
    this.id,
    this.title,
    this.url,
  );

  final PositiveInteger id;
  final NotEmptyString title;
  final Uri? url;
}
