import 'package:contarz/src/widgets/containerDefaultWidget/containerDefaultWidget.dart';
import 'package:contarz/src/widgets/containerScroll/containerScroll.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

import '../../constants/const_application.dart';
import '../../utils/colorsManager.dart';
import '../../Styles/stylesGlobal.dart';
import '../../widgets/inputCustomWidget/inputCustonWidget.dart';

class RecoveryPassView extends StatefulWidget {
  const RecoveryPassView({Key? key}) : super(key: key);

  @override
  State<RecoveryPassView> createState() => _RecoveryPassViewState();
}

class _RecoveryPassViewState extends State<RecoveryPassView> {

  final txtInputEmail = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    this.txtInputEmail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    var textColor = convertFormatColor(TEXT_COLOR);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: styleAppBar1(FlutterI18n.translate(context, "recoveryPassView.appbar.title")),
      body: ContainerDefaultWidget(
        child: ContainerScroll(
          sizeAuto: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 40),
                      child: Text(
                        FlutterI18n.translate(context, "recoveryPassView.title"),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 17,
                            color: textColor
                        ),
                      ),
                    ),
                    InputCustonWidget(
                        hintText:FlutterI18n.translate(context, "recoveryPassView.textinput.hint.email"),
                        obscureText: false,
                        controllerInput: txtInputEmail,
                        iconleft: Icon(Icons.email),
                        textColor: textColor
                    ),
                  ]
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: ElevatedButton(
                          onPressed: () { },
                          child: Text(FlutterI18n.translate(context, "recoveryPassView.button.send")),
                        ),
                        width: double.infinity,
                        padding: EdgeInsets.only(left: 20,right: 20),
                        height: 60,
                      )
                    ],
                  )
                ),
              ),
            ],
          ),
        )
      )
    );
  }
}