import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';
import '../login_logic.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final LoginLogic? logic;

  LoginBloc({this.logic}) : super(LoginInitialState()) {
    // TODO: implement
    on<LoginInEvent>(mapEventToState);
  }

  Future<void> mapEventToState(
      LoginEvent event,
      Emitter<LoginState> emit,
      ) async {
    // TODO: implement mapEventToState
    if(event is LoginInEvent){
      var data = await (_doLogin(event).last);
      emit(data);
    }
  }

  Stream<LoginState> _doLogin(LoginInEvent event) async* {
    try {
      print("${event.email} ===================");
      yield LoginInitialState();
      var token = await logic?.loginIn(event.email, event.password);
      print("${token} ===================");
      yield LoginSucessState();
    } on Exception  {
      yield LoginErrorState("No se pudo loggear");
    }
  }
}
