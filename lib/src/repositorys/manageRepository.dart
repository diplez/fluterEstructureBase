import 'dart:convert';
import 'package:http/http.dart' as http;

/**
 * Clase para crear conexiones genericas
 */
class ManageRepository{

  Map<String, String> headers;
  int timeOut = 60;

  ManageRepository(){
    loadHeaders();
  }

  /**
   * Carga de encabezados de peticion
   */
  void loadHeaders(){
    headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      //'Authorization': '<Your token>'
    };
  }

  /**
   * Obtener datos TYPE: GET
   */
  Future<http.Response> get(String url) {
    return http.get(
        url,
        headers:this.headers
    ).timeout(Duration(seconds: timeOut));
  }

  /**
   * Obtener datos TYPE: POST
   */
  Future<http.Response> post(String url,Map<String, String> body) {
    return http.post(
        url,
        body: json.encode(body),
        headers:this.headers
    ).timeout(Duration(seconds: timeOut));
  }

  /**
   * Obtener datos TYPE: DELETE
   */
  Future<http.Response> delete(String url,Map<String, String> body) {
    return http.delete(
        url,
        headers:this.headers
    ).timeout(Duration(seconds: timeOut));
  }

}