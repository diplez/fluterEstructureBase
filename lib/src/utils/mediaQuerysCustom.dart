
import 'package:flutter/cupertino.dart';

/**
 * Clase para obtener valores de tamanio de pantalla
 */
class MediaQueryCustom{

  late Size sizeScreenPhone;
  late EdgeInsets sizekeyboardPhone;
  late BuildContext context;

  MediaQueryCustom(BuildContext context){
    this.context = context;
    this.sizeScreenPhone = MediaQuery.of(this.context).size;
    this.sizekeyboardPhone = MediaQuery.of(context).viewInsets;
  }

  /**
   * Devuelve ancho de pantalla total
   */
  double widthScreen(){
    return sizeScreenPhone.width;
  }

  /**
   * Devuelve alto de pantalla (Mejorado)
   */
  double heightScreen(){
    return sizeScreenPhone.height-sizekeyboardPhone.bottom;
  }

  /**
   * Alto de pantalla de dispositivos
   */
  bool sizeHeightLess300(){
    return this.heightScreen()<=300;
  }

  bool sizeHeighLess500(){
    return this.heightScreen()<=500;
  }

  bool sizeHeighLess700(){
    return this.heightScreen()<=700;
  }

  bool sizeHeighLess1000(){
    return this.heightScreen()<=1000;
  }

  bool sizeHeighLess1500(){
    return this.heightScreen()<=1500;
  }

  /**
   * Ancho de pantalla de dispositivos
   */
  bool sizeWidthLess300(){
    return this.heightScreen()<=300;
  }

  bool sizeWidthLess500(){
    return this.heightScreen()<=500;
  }

  bool sizeWidthLess700(){
    return this.heightScreen()<=700;
  }

  bool sizeWidthLess1000(){
    return this.heightScreen()<=1000;
  }

  bool sizeWidthLess1500(){
    return this.heightScreen()<=1500;
  }

  /**
   * Ancho y alto de pantalla de dispositivos (Personzalido)
   */
  bool sizeWidthLess(int sizeWidthScream){
    return this.heightScreen()<=sizeWidthScream;
  }

  bool sizeHeighLess(int sizeHeightScream){
    return this.heightScreen()<=sizeHeightScream;
  }
}