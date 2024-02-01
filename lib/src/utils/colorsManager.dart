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

/**
 * Metodo para transformar color Hexadecimal a int
 */
int convertFormatHexToInt(String colorHexadecimal){
  String colorFormat = colorHexadecimal.replaceAll('#', REPLACE);
  return int.parse(colorFormat);
}

/**
 * Metodo para enviar a convertir color con su luminicencia
 * @param: colorbasic
 */
Map<int, Color> dataThemeColor(Color colorbasic){
  Map<int, Color> color =
  {
    50:colorbasic.withOpacity(.1),
    100:colorbasic.withOpacity(.2),
    200:colorbasic.withOpacity(.3),
    300:colorbasic.withOpacity(.4),
    400:colorbasic.withOpacity(.5),
    500:colorbasic.withOpacity(.6),
    600:colorbasic.withOpacity(.7),
    700:colorbasic.withOpacity(.8),
    800:colorbasic.withOpacity(.9),
    900:colorbasic.withOpacity(1),
  };
  return color;
}