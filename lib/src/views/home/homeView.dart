import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:contarz/src/constants/const_application.dart';
import 'package:contarz/src/constants/const_titles_app.dart';
import './../../widgets/inputCustomWidget/inputCustonWidget.dart';
import './../../utils/colorsManager.dart';
import './../../utils/mediaQuerysCustom.dart';
import './../../blocs/loginBloc/bloc/bloc.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  final txtInputUser = TextEditingController();
  final txtInputPassword = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    txtInputUser.dispose();
    txtInputPassword.dispose();
  }

  void _doLogin() {
    BlocProvider.of<LoginBloc>(context).add(
      LoginInEvent(txtInputUser.text, txtInputPassword.text),
    );
  }

  void _showError(BuildContext context, String message) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> ListMyWidgets() {
      List<Widget> list = <Widget>[];
      list.add(new Text("hi"));
      list.add(new Text("hi2"));
      list.add(new Text("hi3"));
      return list;
    }

    var sizeScream = MediaQueryCustom(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(TITLE_HOME),
        ),
        body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginErrorState) {
            _showError(context, state.message);
          }
          if (state is LoginSucessState) {
            print('EXITO VIEW');
            /**Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) => MainPage())
            );**/
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return Center (
              child: Container(
                decoration: BoxDecoration(color: convertFormatColor(COLOR_SECUNDARY)),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: ListMyWidgets()
                      ),
                    ),
                  ],
                ),
              ),
            );
          })
        ),
      floatingActionButton: FloatingActionButton(
        //onPressed: _incrementCounter,
        onPressed: _doLogin,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
