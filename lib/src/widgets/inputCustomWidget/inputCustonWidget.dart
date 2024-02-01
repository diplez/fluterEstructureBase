import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import '../../constants/const_application.dart';

class InputCustonWidget extends StatefulWidget {

  String hintText;
  bool obscureText;
  Color colorBorderInput;
  Color colorBorderFocusedInput;
  TextEditingController? controllerInput;
  Icon? iconleft;
  Color? textColor;

  InputCustonWidget({
    Key? key,
    this.hintText="",
    this.obscureText=false,
    this.colorBorderInput = Colors.black12,
    this.colorBorderFocusedInput = Colors.black12,
    this.controllerInput,
    this.iconleft,
    this.textColor= Colors.black12
  }) : super(key:key);

  @override
  InputCustonWidgetState createState() => InputCustonWidgetState();
}

class InputCustonWidgetState extends State<InputCustonWidget>{

  String? valueTxt;
  bool visibility =true;
  late FocusNode focusNode;

  InputCustonWidgetState(){
  }

  @override
  void initState(){
    super.initState();

    if(widget.controllerInput!=null){
      widget.controllerInput?.addListener(() {
        setState(() {
          this.valueTxt = widget.controllerInput?.text;
        });
      });
    }

    focusNode = FocusNode();
    focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
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
    widget.controllerInput?.clear();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    bool existData = widget.controllerInput?.text?.isNotEmpty??true;

    return Container(
      margin: EdgeInsets.only(top: 1,bottom: 1),
      padding: EdgeInsets.only(left: 20, right: 20,top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              style: TextStyle(
                  color: widget.textColor
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return FlutterI18n.translate(context, "generals.validation.required");
                }
                return null;
              },
              controller: widget.controllerInput,
              obscureText: widget.obscureText?visibility:false,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white.withOpacity(0.6),
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  color: widget.textColor
                ),
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
                  icon: Icon(widget.obscureText?visibility?Icons.visibility:Icons.visibility_off:existData?Icons.clear:null),
                  onPressed:widget.obscureText?_onVisibilityOnOff:_onClearText
                ),
                prefixIcon: widget.iconleft!=null?Align(
                  widthFactor: 1.0,
                  heightFactor: 1.0,
                  child: widget.iconleft,
                ):null,
              ),
              focusNode: focusNode
            )
          ],
        ),
    );
  }
}