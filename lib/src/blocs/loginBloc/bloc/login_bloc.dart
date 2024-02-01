import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'login_event.dart';
import 'login_state.dart';
import '../loginLogic.dart';

/**
 * Clase bloc para login
 */
class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final LoginLogic? logic;

  LoginBloc({this.logic}) : super(LoginInitialState()) {
    // TODO: implement
    print('LoginBloc -> es');
    on<LoginInEvent>(mapEventToState);
  }

  @override
  Future<void> mapEventToState(
      LoginEvent event,
      Emitter<LoginState> emit,
      ) async {
    print('data');
    // TODO: implement mapEventToState
    if(event is LoginInEvent){
      var data = await (_doLogin(event).last);
      print('${data} estado devuelto');
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
