import 'dart:convert';

import 'package:hacker_news/data/dto/hacker_news_dto.dart';
import 'package:hacker_news/data/exception/http_exception.dart';
import 'package:http/http.dart' as http;

abstract class RemoteHackerNewsDataSource {
  Future<List<int>> topStoryIds();

  Future<HackerNewsDto> newsById(int id);
}

class RemoteHackerNewsDataSourceImpl implements RemoteHackerNewsDataSource {
  static const String _BASE_URL = "https://hacker-news.firebaseio.com/v0/";

  @override
  Future<List<int>> topStoryIds() async {
    final uri = Uri.parse(_BASE_URL + "topstories.json");
    final response = await http.get(uri);

    if (response.statusCode < 200 || 299 < response.statusCode) {
      throw HttpException(response.statusCode, response.body);
    }

    return (jsonDecode(response.body) as List<dynamic>)
        .map((e) => e as int)
        .toList()
        .sublist(0, 20);
  }

  @override
  Future<HackerNewsDto> newsById(int id) async {
    final uri = Uri.parse(_BASE_URL + "item/$id.json");
    final response = await http.get(uri);

    if (response.statusCode < 200 || 299 < response.statusCode) {
      throw HttpException(response.statusCode, response.body);
    }

    return HackerNewsDto.fromJson(jsonDecode(response.body));
  }
}
