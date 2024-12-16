class AppExceptions implements Exception {
  final String?  _message;
  final String?  _prefix;

  AppExceptions([this._message, this._prefix]);
  @override
  String toString() {
    return '$_message$_prefix';
  }
}

class NoInternetException extends AppExceptions {
  NoInternetException([String? message]) : super(message, '');
}
class UnauthourisedException extends AppExceptions {
  UnauthourisedException([String? message]) : super(message, 'You dont have acces to this');
}

class RequestTimeOutException extends AppExceptions {
  RequestTimeOutException([String? message]) : super(message, 'Request timeout');
}
class FetchDataException extends AppExceptions {
  FetchDataException([String? message]) : super(message, '');
}