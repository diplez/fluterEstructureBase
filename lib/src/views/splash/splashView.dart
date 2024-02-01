import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {

  SplashView({required Key key}) : super(key:key);

  @override
  SplashViewState createState() => SplashViewState();
}

class SplashViewState extends State<SplashView>{

  SplashViewState();

  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.deepOrange)
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  flex: 2,
                  child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Colors.deepOrange,
                            radius: 50.0,
                            child: Icon(
                              Icons.account_circle,
                              size: 50,
                            ),
                          )
                        ],
                      )
                  )

              )
            ],
          )
        ],
      ),
    );
  }
}