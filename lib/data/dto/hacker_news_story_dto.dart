import 'package:hacker_news/data/dto/base/hacker_news_base_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hacker_news_story_dto.g.dart';

@JsonSerializable()
class HackerNewsStoryDto extends HackerNewsBaseDto {
  HackerNewsStoryDto({
    required int id,
    required String type,
    bool? deleted,
    String? by,
    int? time,
    bool? dead,
    List<int>? kids,
    this.descendants,
    this.score,
    this.title,
    this.url,
  }) : super(
          id: id,
          type: type,
          deleted: deleted,
          by: by,
          time: time,
          dead: dead,
          kids: kids,
        );

  final int? descendants;
  final int? score;
  final String? title;
  final String? url;

  factory HackerNewsStoryDto.fromJson(Map<String, dynamic> json) =>
      _$HackerNewsStoryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$HackerNewsStoryDtoToJson(this);
}
