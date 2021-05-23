// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hacker_news_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HackerNewsDto _$HackerNewsDtoFromJson(Map<String, dynamic> json) {
  return HackerNewsDto(
    json['id'] as int,
    json['by'] as String,
    json['descendants'] as int?,
    (json['kids'] as List<dynamic>?)?.map((e) => e as int).toList(),
    json['score'] as int,
    json['time'] as int,
    json['title'] as String,
    json['type'] as String,
    json['url'] as String?,
  );
}

Map<String, dynamic> _$HackerNewsDtoToJson(HackerNewsDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'by': instance.by,
      'descendants': instance.descendants,
      'kids': instance.kids,
      'score': instance.score,
      'time': instance.time,
      'title': instance.title,
      'type': instance.type,
      'url': instance.url,
    };
