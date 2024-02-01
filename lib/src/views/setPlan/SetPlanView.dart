import 'package:contarz/src/Styles/stylesGlobal.dart';
import 'package:contarz/src/constants/const_application.dart';
import 'package:contarz/src/utils/colorsManager.dart';
import 'package:contarz/src/widgets/containerDefaultWidget/containerDefaultWidget.dart';
import 'package:contarz/src/widgets/containerScroll/containerScroll.dart';
import 'package:contarz/src/widgets/inputCustomWidget/inputCustonWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class SetPlanView extends StatefulWidget {
  const SetPlanView({Key? key}) : super(key: key);

  @override
  State<SetPlanView> createState() => _SetPlanViewState();
}

class _SetPlanViewState extends State<SetPlanView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var textColor = convertFormatColor(TEXT_COLOR);
    var sizeLVHorizl = 200.0;
    return Scaffold(
        body: ContainerDefaultWidget(
            child: ContainerScroll(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(20),
                            width: double.infinity,
                            child: Text(
                              FlutterI18n.translate(context, "setPlanView.title1",translationParams: {"name": "Diego"}),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: textColor
                              ),
                            )
                          ),
                          Container(
                              width: double.infinity,
                              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                              child: Text(
                                FlutterI18n.translate(context, "setPlanView.title2"),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: textColor
                                ),
                              )
                          ),
                          Container(
                              width: double.infinity,
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: Text(
                                FlutterI18n.translate(context, "setPlanView.subTitle"),
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: textColor
                                ),
                              )
                          ),
                        ]
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                        width: double.infinity,
                        child: Container(
                          //margin: const EdgeInsets.symmetric(vertical: 10.0),
                          height: 100.0,
                          child: ListView(
                            // This next line does the trick.
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              Container(
                                width: sizeLVHorizl,
                                color: Colors.red,
                              ),
                              Container(
                                width: sizeLVHorizl,
                                color: Colors.blue,
                              ),
                              Container(
                                width: sizeLVHorizl,
                                color: Colors.green,
                              ),
                              Container(
                                width: sizeLVHorizl,
                                color: Colors.yellow,
                              ),
                              Container(
                                width: sizeLVHorizl,
                                color: Colors.orange,
                              ),
                            ],
                          ),
                        ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          FlutterI18n.translate(context, "setPlanView.description"),
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              //fontSize: 10,
                              color: textColor
                          ),
                        )
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 60,
                            padding: EdgeInsets.only(left: 20,right: 20),
                            child: ElevatedButton(
                              onPressed: () {
                                //Navigator.pushNamed(context, ROUTE_SET_PLAN);
                                //Para qie se active validacion
                                /*if (_formkeyCreate.currentState!.validate()) {

                            }**/
                              },
                              child: Text(FlutterI18n.translate(context, "createAccoutView.button.register")),
                            ),
                          )
                        ],
                      )
                  )
                ],
              ),
            )
        )
    );
  }
}
