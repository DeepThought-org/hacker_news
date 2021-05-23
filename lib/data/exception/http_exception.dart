class HttpException implements Exception {
  HttpException(this.code, this.body);

  final int code;
  final String body;
}