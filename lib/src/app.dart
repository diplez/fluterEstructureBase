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
    dato.insertUser(new User(id: 2, username: 'NATHY', password: 'clave',roles: rol));

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
