
abstract class LoginEvent {
  LoginEvent();
}

class LoginInEvent extends LoginEvent {
  final String email;
  final String password;

  LoginInEvent(this.email, this.password){
    print(this.password);
  }

  @override
  List<Object> get props => [email, password];
}
