abstract class Failure {
  final String message;
  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(String message) : super(message);
}

class ConnectionFailure extends Failure {
  ConnectionFailure(String message) : super(message);
}

class DatabaseFailure extends Failure {
  DatabaseFailure(String message) : super(message);
}

class SignInFailure extends Failure {
  SignInFailure(String message) : super(message);
}

class NoLocaleStoredLocally extends Failure {
  NoLocaleStoredLocally(String message) : super(message);
}

class SignOutFailure extends Failure {
  SignOutFailure(String message) : super(message);
}

class DeleteAccountFailure extends Failure {
  DeleteAccountFailure(String message) : super(message);
}

class IncompatibleProblems extends Failure {
  IncompatibleProblems(String message) : super(message);
}

class EmailSentFailure extends Failure {
  EmailSentFailure(String message) : super(message);
}

class NotificationFailure extends Failure {
  NotificationFailure(String message) : super(message);
}
