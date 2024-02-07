import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:restitution/src/domains/constants/const_application.dart';
import 'package:restitution/src/domains/constants/const_routes.dart';
import 'package:restitution/src/ui/widgets/container_default/container_default_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:restitution/src/ui/widgets/input_custom/input_custon_widget.dart';
import 'package:restitution/src/utils/colorsManager.dart';
import 'package:restitution/src/utils/mediaQuerysCustom.dart';
import 'package:restitution/src/blocs/loginBloc/bloc/bloc.dart';

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
    txtInputUser.dispose();
    txtInputPassword.dispose();
    super.dispose();
  }

  void _doLogin() {
    EasyLoading.show(status: 'loading...');
    BlocProvider.of<LoginBloc>(context).add(
      LoginInEvent(txtInputUser.text, txtInputPassword.text),
    );
  }

  void _showError(BuildContext context,String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var sizeScream = MediaQueryCustom(context);
    var textColor = convertFormatColor(TEXT_COLOR);
    var buttonColor = convertFormatColor(COLOR_SECUNDARY);
    return Scaffold(
        body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginErrorState) {
            _showError(context, state.message);
          }
          if (state is LoginSucessState) {
            EasyLoading.dismiss();
            Navigator.pushNamed(context, ROUTE_HOME);
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return Center (
              child: ContainerDefaultWidget(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          if(!sizeScream.sizeHeightLess300())
                            SizedBox(
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    FlutterI18n.translate(context, "loginView.title"),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      color: textColor,
                                    ),
                                  )
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
                                hintText:FlutterI18n.translate(context, "loginView.textinput.hint.user"),
                                obscureText: false,
                                colorBorderFocusedInput: convertFormatColor(COLOR_PRIMARY),
                                controllerInput: txtInputUser,
                                iconleft: Icon(Icons.email),
                                textColor: textColor
                              ),
                              InputCustonWidget(
                                  hintText:FlutterI18n.translate(context, "loginView.textinput.hint.password"),
                                obscureText: true,
                                colorBorderFocusedInput: convertFormatColor(COLOR_PRIMARY),
                                iconleft: Icon(Icons.lock),
                                textColor: textColor
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 20),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    style: ButtonStyle(
                                      foregroundColor: MaterialStateProperty.all<Color>(textColor),
                                    ),
                                    onPressed: () {
                                      Navigator.pushNamed(context, ROUTE_RECOVERY_PASS);
                                    },
                                    child: Text(FlutterI18n.translate(context, "loginView.button.password"),),
                                  )
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(top: 50),
                                  padding: EdgeInsets.all(20.0),
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: SizedBox(
                                      width: double.infinity,
                                      height: 60,
                                      child: ElevatedButton(
                                          onPressed: _doLogin,
                                          child: Text(
                                              (state is LoginInitialState)?'Cargando':'Iniciar Sesion',
                                              style: TextStyle(
                                                  fontSize: 20,color: textColor
                                              )
                                          ),
                                          style: ButtonStyle(
                                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(18.0),
                                                    side: BorderSide(color: convertFormatColor(COLOR_PRIMARY))
                                                ),
                                              ),
                                            backgroundColor: MaterialStateProperty.all<Color>(buttonColor)
                                          )
                                        //color: convertFormatColor(COLOR_PRIMARY),
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
                        flex: 2,
                        child: Container(
                          child:
                            TextButton(
                              style: ButtonStyle(
                                foregroundColor: MaterialStateProperty.all<Color>(textColor),
                              ),
                              onPressed: () {
                                //Navigator.pushNamed(context, ROUTE_ACCOUNT_CREATE);
                              },
                              child: Text(
                                  FlutterI18n.translate(context, "loginView.button.account"),
                                  style: TextStyle(
                                      fontSize: 15
                                  )
                              ),
                            )
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
