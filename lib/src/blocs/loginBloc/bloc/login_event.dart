/// Eventos para autenticación
class LoginInEvent extends LoginEvent {
  final String email;
  final String password;

  LoginInEvent(this.email, this.password){
    print(this.password);
  }

  List<Object> get props => [email, password];
}

/// Interfaces para eventos
abstract class LoginEvent {
  LoginEvent();
}

