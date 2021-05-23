import 'package:hacker_news/data/exception/http_exception.dart';
import 'package:http/http.dart' as http;

class HttpClient {
  HttpClient._(this.baseUrl);

  final String baseUrl;

  Future<http.Response> get(String path) async {
    final response = await http.get(Uri.parse("$baseUrl$path"));
    if (!_successfulStatusCode(response.statusCode)) {
      throw createHttpException(response);
    }

    return response;
  }

  bool _successfulStatusCode(int statusCode) {
    return 200 <= statusCode && statusCode < 300;
  }

  HttpException createHttpException(http.Response response) {
    return HttpException(response.statusCode, response.body);
  }
}

class HttpClientBuilder {
  HttpClientBuilder(this.baseUrl);

  final String baseUrl;

  HttpClient build() {
    return HttpClient._(baseUrl);
  }
}
