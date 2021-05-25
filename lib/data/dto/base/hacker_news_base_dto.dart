import 'package:json_annotation/json_annotation.dart';

class HackerNewsBaseDto {
  HackerNewsBaseDto({
    required this.id,
    required this.type,
    this.deleted,
    this.by,
    this.time,
    this.dead,
    this.kids,
  });

  final int id;
  final String type;
  final bool? deleted;
  final String? by;
  final int? time;
  final bool? dead;
  final List<int>? kids;
}
