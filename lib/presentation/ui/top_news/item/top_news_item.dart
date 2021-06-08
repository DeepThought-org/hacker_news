import 'package:equatable/equatable.dart';

class TopNewsItem extends Equatable {
  TopNewsItem(this.id, this.title, this.url);

  final int id;
  final String title;
  final Uri? url;

  @override
  List<Object?> get props => [id, title, url];
}
