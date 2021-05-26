import 'package:equatable/equatable.dart';

class TopNewsItem extends Equatable {
  TopNewsItem(this.title, this.url);

  final String title;
  final Uri? url;

  @override
  List<Object?> get props => [title, url];
}
