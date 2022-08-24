import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'views/login/loginView.dart';
import 'blocs/loginBloc/bloc/bloc.dart';
import 'blocs/loginBloc/loginLogic.dart';
import 'dao/UserDao.dart';
import 'models/UserModel.dart';
import 'models/RoleModel.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context){
    var dato = UserDao();
    var rol = new Rol(id:1,code: "Rol_001",name: "DOCENTE");
    dato.insertUser(new User(id: 2, username: 'NATHY', password: 'clave',roles: rol));

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:BlocProvider(
        create: (_) => LoginBloc(
          logic: LoginLogic(),
        ),
        child: LoginView()
      ),
    );
  }
}
