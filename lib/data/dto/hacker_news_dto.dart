import 'package:json_annotation/json_annotation.dart';

part 'hacker_news_dto.g.dart';

@JsonSerializable()
class HackerNewsDto {
  HackerNewsDto(
    this.id,
    this.by,
    this.descendants,
    this.kids,
    this.score,
    this.time,
    this.title,
    this.type,
    this.url,
  );

  final int id;
  final String by;
  final int? descendants;
  final List<int>? kids;
  final int score;
  final int time;
  final String title;
  final String type;
  final String? url;

  factory HackerNewsDto.fromJson(Map<String, dynamic> json) =>
      _$HackerNewsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$HackerNewsDtoToJson(this);
}
