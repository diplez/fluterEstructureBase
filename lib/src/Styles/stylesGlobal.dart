import 'package:flutter/material.dart';

/**
 * Modelo de app bar para login, recuperar clave, etc
 */
AppBar styleAppBar1(String title){
  return AppBar(
    title: Text(
      title,
      style: TextStyle(
          color: Colors.white
      ),
    ),
    backgroundColor: Color(0x44000000),
    elevation: 0,
    foregroundColor: Colors.white,
  );
}

/**
 * Boton raised para thema
 */
final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(20)),
  ),
);