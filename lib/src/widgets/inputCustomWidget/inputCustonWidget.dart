import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './../../constants/const_application.dart';

class InputCustonWidget extends StatefulWidget {

  String hintText;
  bool obscureText;
  Color colorBorderInput;
  Color colorBorderFocusedInput;
  TextEditingController controllerInput;

  InputCustonWidget({
    Key key,
    this.hintText,
    this.obscureText=false,
    this.colorBorderInput = Colors.black12,
    this.colorBorderFocusedInput = Colors.black12,
    this.controllerInput
  }) : super(key:key);

  @override
  InputCustonWidgetState createState() => InputCustonWidgetState();
}

class InputCustonWidgetState extends State<InputCustonWidget>{

  bool visibility =true;

  InputCustonWidgetState(){
  }

  @override
  void initState(){
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

  void _onClearText() {
    widget.controllerInput.clear();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(20.0),
      //decoration: BoxDecoration(color: Color(COLOR_PRIMARY)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              controller: widget.controllerInput,
              obscureText: widget.obscureText?visibility:false,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: widget.hintText,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: widget.colorBorderInput, width: 1.0),
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: widget.colorBorderFocusedInput, width: 1.0),
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                ),
                suffixIcon: IconButton(
                  icon: Icon(widget.obscureText?visibility?Icons.visibility:Icons.visibility_off:Icons.clear),
                  onPressed:widget.obscureText?_onVisibilityOnOff:_onClearText
                ),
              ),
            )
          ],
        ),
    );
  }
}