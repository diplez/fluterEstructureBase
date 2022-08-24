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
  }

  @override
  Stream<LoginState> mapEventToState(
      LoginEvent event,
      ) async* {
    // TODO: implement mapEventToState
    if(event is LoginInEvent){
      yield* _doLogin(event);
    }
  }

  Stream<LoginState> _doLogin(LoginInEvent event) async* {
    try {
      yield LoginInitialState();
      var token = await logic?.loginIn(event.email, event.password);
      print("${token} ===================");
      yield LoginSucessState();
    } on Exception  {
      yield LoginErrorState("No se pudo loggear");
    }
  }
}
