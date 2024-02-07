import 'dart:ui';
import 'package:restitution/src/domains/constants/const_images.dart';
import 'package:restitution/src/utils/colorsManager.dart';
import 'package:flutter/material.dart';
import 'package:restitution/src/domains/constants/const_application.dart';

class ContainerDefaultWidget extends StatefulWidget {

  late EdgeInsets? paddingEdgeInsets;
  Widget? child;

  ContainerDefaultWidget(
      {Key? key,
      this.child,
      this.paddingEdgeInsets})
      : super(key: key);

  @override
  ContainerDefaultWidgetState createState() => ContainerDefaultWidgetState();
}

class ContainerDefaultWidgetState extends State<ContainerDefaultWidget> {
  bool visibility = true;

  InputCustonWidgetState() {}

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onVisibilityOnOff() {
    setState(() {
      if (visibility) {
        visibility = false;
      } else {
        visibility = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        image: DecorationImage(
          image: AssetImage(FONDO_1),
          fit: BoxFit.fill,
        ),
      ),
      child: Container(
        padding: widget.paddingEdgeInsets??EdgeInsets.only(),
        decoration: BoxDecoration(
          color: Colors.white,
          gradient: LinearGradient(
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              colors: [
                convertFormatColor(COLOR_DG_1).withOpacity(.6),
                convertFormatColor(COLOR_DG_2).withOpacity(.9)
              ],
              stops: [
                0.0,
                1.0
              ]
          ),
        ),
        child: widget.child,
      ),
    );
  }
}
