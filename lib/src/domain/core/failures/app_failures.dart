abstract class AppFailures implements Exception {}

class NoDataFound extends AppFailures {
  NoDataFound(this.errorMessage);
  final String errorMessage;
}

class UnknownError extends AppFailures {
  UnknownError(this.errorMessage);
  final String errorMessage;
}
