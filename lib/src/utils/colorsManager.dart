import 'package:flutter/cupertino.dart';
/**
 * Variables Globales
 */
final REPLACE = '0xFF',NUMERAL='#';

/**
 * Metodo para transformar color Hexadecimal a formato entendible en dart
 */
Color convertFormatColor(String colorHexadecimal){
  String colorFormat = colorHexadecimal.replaceAll('#', REPLACE);
  return Color(int.parse(colorFormat));
}