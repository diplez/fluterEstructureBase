import 'package:contarz/src/constants/const_application.dart';
import 'package:contarz/src/constants/const_routes.dart';
import 'package:contarz/src/views/createAccount/CreateAccountView.dart';
import 'package:contarz/src/views/recoveryPass/recoveryPassView.dart';
import 'package:contarz/src/views/setPlan/SetPlanView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'Styles/stylesGlobal.dart';
import 'utils/colorsManager.dart';
import 'views/login/loginView.dart';
import 'blocs/loginBloc/bloc/bloc.dart';
import 'blocs/loginBloc/loginLogic.dart';
import 'dao/UserDao.dart';
import 'models/UserModel.dart';
import 'models/RoleModel.dart';
import 'package:localstore/localstore.dart';

class App extends StatelessWidget {
  final _db = Localstore.instance;
  final FlutterI18nDelegate flutterI18nDelegate;

  App(this.flutterI18nDelegate);
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context){
    var dato = UserDao();
    var rol = new Rol(id:1,code: "Rol_001",name: "DOCENTE");
    dato.insertUser(new User(id: 2, username: 'Test', password: 'clave',roles: rol));

    // gets new id
    final id = _db.collection('todos').doc().id;
    print("--"+id);
// save the item
    /**_db.collection('todos').doc(id).set({
      'title': 'Todo title',
      'done': false
    });**/

    final items = Future(() async {
      return await _db.collection('todos').get();
    });

    items.then((value) => {
      value?.entries.forEach((element) {
        print(element.key);
      })
    });

    items.asStream().listen((event) {
      print(event?.entries.length);
    });

    _db.collection('todos').doc('38g0gdong').delete();
    //final stream = _db.collection('todos').doc().delete();
    //stream.listen((event) {print("key -> "+event.values.toString());});

    //print("datos "+ Future.wait(stream.single));

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: new MaterialColor(convertFormatHexToInt(COLOR_PRIMARY),dataThemeColor(convertFormatColor(COLOR_PRIMARY))),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        elevatedButtonTheme: ElevatedButtonThemeData(style: raisedButtonStyle)
      ),
      routes: <String, WidgetBuilder>{
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
            child: RecoveryPassView(),
          );
        },
        ROUTE_ACCOUNT_CREATE:(BuildContext context) {
          return BlocProvider(
            create: (_) => LoginBloc(
              logic: LoginLogic(),
            ),
            child: CreateAccountView(),
          );
        },
        ROUTE_SET_PLAN:(BuildContext context) {
          return BlocProvider(
            create: (_) => LoginBloc(
              logic: LoginLogic(),
            ),
            child: SetPlanView(),
          );
        },
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