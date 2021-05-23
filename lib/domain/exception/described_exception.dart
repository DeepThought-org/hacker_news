import 'dart:io';

import 'package:hacker_news/data/exception/http_exception.dart';

class DescribedException implements Exception {
  DescribedException(this.original, this.message);

  final Exception original;
  final String message;
}

class NotFoundException extends DescribedException {
  NotFoundException(HttpException original)
      : super(
          original,
          "NotFoundException",
        );
}

class UnknownException extends DescribedException {
  UnknownException(Exception original)
      : super(
          original,
          "UnknownException",
        );
}
