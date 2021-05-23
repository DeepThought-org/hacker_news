import 'dart:io';

import 'package:hacker_news/data/exception/http_exception.dart';
import 'package:hacker_news/domain/exception/described_exception.dart';

class HttpExceptionDescriber {
  DescribedException describe(Exception e) {
    switch (e.runtimeType) {
      case HttpException:
        return _describedHttpException(e as HttpException);

      default:
        return UnknownException(e);
    }
  }

  DescribedException _describedHttpException(HttpException e) {
    switch (e.code) {
      case 400:
        return NotFoundException(e);

      default:
        return UnknownException(e);
    }
  }
}
