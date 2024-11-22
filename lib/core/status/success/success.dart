abstract class success{
  final String message;
  const success(this.message);
}

class successSignIn extends success{
  final Map<String,dynamic> userData;
  const successSignIn(String message,this.userData):super(message);
}
class successSignOut extends success{
  const successSignOut(String message):super(message);
}
class accountDeletedSuccessfully extends success{
  const accountDeletedSuccessfully(String message):super(message);
}
class accountDatabaseOperation extends success{
  const accountDatabaseOperation(String message):super(message);
}
class DatabaseDeleteSuccessfully extends success{
  const DatabaseDeleteSuccessfully(String message):super(message);
}
class DatabaseAddingSuccessfully extends success{
  const DatabaseAddingSuccessfully(String message):super(message);
}
class DatabaseUpdatedSuccessfully extends success{
  const DatabaseUpdatedSuccessfully(String message):super(message);
}
class messageSentSuccessfully extends success{
  const messageSentSuccessfully(String message):super(message);
}
class notificationSentSuccessfully extends success{
  const notificationSentSuccessfully(String message):super(message);
}