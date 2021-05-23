import 'dart:convert';

import 'package:hacker_news/data/client/http_client.dart';
import 'package:hacker_news/data/dto/hacker_news_dto.dart';
import 'package:hacker_news/data/exception/http_exception.dart';

abstract class RemoteHackerNewsDataSource {
  Future<List<int>> topStoryIds();

  Future<HackerNewsDto> newsById(int id);
}

class RemoteHackerNewsDataSourceImpl implements RemoteHackerNewsDataSource {
  static const String _BASE_URL = "https://hacker-news.firebaseio.com/v0/";

  final HttpClient _httpClient = HttpClientBuilder(_BASE_URL).build();

  @override
  Future<List<int>> topStoryIds() async {
    final response = await _httpClient.get("topstories.json");

    return (jsonDecode(response.body) as List<dynamic>)
        .map((e) => e as int)
        .toList()
        .sublist(0, 20);
  }

  @override
  Future<HackerNewsDto> newsById(int id) async {
    final response = await _httpClient.get("item/$id.json");

    return HackerNewsDto.fromJson(jsonDecode(response.body));
  }
}
