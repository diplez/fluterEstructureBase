import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'views/login/loginView.dart';
import 'blocs/loginBloc/bloc/bloc.dart';
import 'blocs/loginBloc/loginLogic.dart';
import 'dao/UserDao.dart';
import 'models/UserModel.dart';
import 'models/RoleModel.dart';

class App extends StatelessWidget {

  final FlutterI18nDelegate flutterI18nDelegate;

  App(this.flutterI18nDelegate);
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
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) {
          return BlocProvider(
              create: (_) => LoginBloc(
                logic: LoginLogic(),
              ),
              child: LoginView()
          );
        },
        '/about': (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('About Route'),
            ),
          );
        }
      },
      localizationsDelegates: [
        flutterI18nDelegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      builder: FlutterI18n.rootAppBuilder(),
    );
  }
}
