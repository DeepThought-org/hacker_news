class HackerNewsCache {
  HackerNewsCache(this.id, this.by, this.title, this.url) {
    cachedTime = DateTime.now();
  }

  final int id;
  final String by;
  final String title;
  final String url;

  late final DateTime cachedTime;

  bool get expired => cachedTime.difference(DateTime.now()).inDays > 1;
}
