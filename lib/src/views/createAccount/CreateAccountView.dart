import 'package:contarz/src/constants/const_application.dart';
import 'package:contarz/src/constants/const_routes.dart';
import 'package:contarz/src/utils/colorsManager.dart';
import 'package:contarz/src/widgets/containerScroll/containerScroll.dart';
import 'package:contarz/src/widgets/inputCustomWidget/inputCustonWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

import '../../Styles/stylesGlobal.dart';
import '../../widgets/containerDefaultWidget/containerDefaultWidget.dart';

class CreateAccountView extends StatefulWidget {

  const CreateAccountView({Key? key}) : super(key: key);

  @override
  State<CreateAccountView> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {

  final _formkeyCreate = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    var textColor = convertFormatColor(TEXT_COLOR);

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: styleAppBar1(FlutterI18n.translate(context, "createAccoutView.appbar.title")),
        body: ContainerDefaultWidget(
          child: ContainerScroll(
            marginEdgeInsets: EdgeInsets.only(top:SIZE_APPBAR),
            paddingEdgeInsetsScroll: EdgeInsets.only(top: 10),
            expanded: false,
            child: Form(
              key: _formkeyCreate,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InputCustonWidget(
                      hintText:FlutterI18n.translate(context, "generals.fiedls.firstname"),
                      obscureText: false,
                      //controllerInput: txtInputEmail,
                      iconleft: Icon(Icons.account_circle_rounded),
                      textColor: textColor
                  ),
                  InputCustonWidget(
                      hintText:FlutterI18n.translate(context, "generals.fiedls.lastname"),
                      obscureText: false,
                      //controllerInput: txtInputEmail,
                      iconleft: Icon(Icons.account_circle_rounded),
                      textColor: textColor
                  ),
                  InputCustonWidget(
                      hintText:FlutterI18n.translate(context, "generals.fiedls.dni"),
                      obscureText: false,
                      //controllerInput: txtInputEmail,
                      iconleft: Icon(Icons.account_circle_rounded),
                      textColor: textColor
                  ),
                  InputCustonWidget(
                      hintText:FlutterI18n.translate(context, "generals.fiedls.nameBussines"),
                      obscureText: false,
                      //controllerInput: txtInputEmail,
                      iconleft: Icon(Icons.account_circle_rounded),
                      textColor: textColor
                  ),
                  InputCustonWidget(
                      hintText:FlutterI18n.translate(context, "generals.fiedls.email"),
                      obscureText: false,
                      //controllerInput: txtInputEmail,
                      iconleft: Icon(Icons.email),
                      textColor: textColor
                  ),
                  InputCustonWidget(
                      hintText:FlutterI18n.translate(context, "generals.fiedls.phone"),
                      obscureText: false,
                      //controllerInput: txtInputEmail,
                      iconleft: Icon(Icons.phone),
                      textColor: textColor
                  ),
                  InputCustonWidget(
                      hintText:FlutterI18n.translate(context, "generals.fiedls.password"),
                      obscureText: false,
                      //controllerInput: txtInputEmail,
                      iconleft: Icon(Icons.lock),
                      textColor: textColor
                  ),
                  InputCustonWidget(
                      hintText:FlutterI18n.translate(context, "generals.fiedls.passwordConfirm"),
                      obscureText: false,
                      //controllerInput: txtInputEmail,
                      iconleft: Icon(Icons.lock),
                      textColor: textColor
                  ),
                  Container(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, ROUTE_SET_PLAN);
                        //Para qie se active validacion
                        /*if (_formkeyCreate.currentState!.validate()) {

                        }**/
                      },
                      child: Text(FlutterI18n.translate(context, "createAccoutView.button.register")),
                    ),
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.only(left: 20,right: 20),
                    height: 60,
                  )
                ],
              ),
            )
          )
        )
    );
  }
}
