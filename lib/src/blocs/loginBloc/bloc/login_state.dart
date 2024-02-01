
abstract class LoginState {
  LoginState();
}

class LoginInitialState extends LoginState {}

class LoginProcessState extends LoginState {}

class LoginSucessState extends LoginState {}

class LoginErrorState extends LoginState {

  String message;

  LoginErrorState(this.message);

  @override
  List<Object> get props => [message];
}
