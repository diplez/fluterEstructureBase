import 'package:contarz/src/constants/const_application.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/inputCustomWidget/inputCustonWidget.dart';
import '../../utils/colorsManager.dart';
import '../../utils/mediaQuerysCustom.dart';
import '../../blocs/loginBloc/bloc/bloc.dart';

class LoginView extends StatefulWidget {
  LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

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
    print('======================= diei');
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
    var sizeScream = MediaQueryCustom(context);
    return Scaffold(
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
                        children: <Widget>[
                          SizedBox(
                            height: sizeScream.heightScreen()/3.5,
                            child: Image(
                              image: AssetImage(
                                'lib/src/resources/images/logoGenus.png',
                              ),
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          if(!sizeScream.sizeHeightLess300())
                            SizedBox(
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    'GENUS',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      color: convertFormatColor(COLOR_PRIMARY),
                                    ),
                                  ),
                                  Text(
                                    'Plataforma de Gestion Académica',
                                    style: TextStyle(
                                      color: convertFormatColor(COLOR_PRIMARY),
                                    ),
                                  ),
                                ],
                              ),
                            )
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 10,
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              InputCustonWidget(
                                hintText:'Ingrese Usuario',
                                obscureText: false,
                                colorBorderFocusedInput: convertFormatColor(COLOR_PRIMARY),
                                controllerInput: txtInputUser,
                              ),
                              InputCustonWidget(
                                hintText:'Ingrese Contraseña',
                                obscureText: true,
                                colorBorderFocusedInput: convertFormatColor(COLOR_PRIMARY),
                              ),
                              Container(
                                  padding: EdgeInsets.all(20.0),
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: 60,
                                    child: RaisedButton(
                                      onPressed: _doLogin,
                                      child: Text(
                                          (state is LoginInitialState)?'Cargando':'Iniciar Sesion',
                                          style: TextStyle(
                                              fontSize: 20,color: Colors.white
                                          )
                                      ),
                                      color: convertFormatColor(COLOR_PRIMARY),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(18.0),
                                          side: BorderSide(color: convertFormatColor(COLOR_PRIMARY))
                                      ),
                                    ),
                                  )
                              )
                            ],
                          ),
                        )
                    ),
                    if(!sizeScream.sizeHeighLess500())
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: <Widget>[
                            Text('LojaSoft Solution')
                          ],
                        ),
                      )
                  ],
                ),
              ),
            );
          })
        )
    );
  }
}
