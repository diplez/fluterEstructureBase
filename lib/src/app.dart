import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './blocs/loginBloc/bloc/bloc.dart';
import './blocs/loginBloc/loginLogic.dart';
import './dao/UserDao.dart';
import './models/UserModel.dart';
import './models/RoleModel.dart';
import './views/home/homeView.dart';
import './constants/const_application.dart';
import './utils/colorsManager.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context){
    var dato = UserDao();
    var rol = new Rol(id:1,code: "Rol_001",name: "DOCENTE");
    dato.insertUser(new User(id: 2, username: 'NATHY', password: 'clave',roles: rol));

    return MaterialApp(
      title: 'Nota D',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange, //convertFormatColor(COLOR_SECUNDARY),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:BlocProvider(
        create: (_) => LoginBloc(
          logic: LoginLogic(),
        ),
        child: HomeView()
      ),
    );
  }
}
