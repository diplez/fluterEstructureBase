import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restitution/src/blocs/loginBloc/bloc/bloc.dart';
import 'package:restitution/src/blocs/loginBloc/login_logic.dart';
import 'package:restitution/src/domains/constants/const_routes.dart';
import 'package:restitution/src/ui/views/login/login_view.dart';
import 'package:restitution/src/ui/views/navigation_home_screen.dart';

final login_routes = <String, WidgetBuilder>{
  ROUTE_INIT: (BuildContext context) {
    return BlocProvider(
        create: (_) => LoginBloc(
          logic: LoginLogic(),
        ),
        child: LoginView()
    );
  },
  ROUTE_RECOVERY_PASS: (BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(
        logic: LoginLogic(),
      ),
      child: Text("Pendiente"),
    );
  },
  ROUTE_ACCOUNT_CREATE:(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(
        logic: LoginLogic(),
      ),
      child: Text("Pendiente"),
    );
  },
  ROUTE_SET_PLAN:(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(
        logic: LoginLogic(),
      ),
      child: Text("Pendiente"),
    );
  },
  ROUTE_HOME:(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(
        logic: LoginLogic(),
      ),
      child: NavigationHomeScreen(),
    );
  },
};
