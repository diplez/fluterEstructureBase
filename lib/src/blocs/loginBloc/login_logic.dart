import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'interfaces/ilogin_logic.dart';
import 'package:restitution/src/services/manage_service.dart';
import 'package:http/http.dart' as http;

class LoginLogic extends  LoginLogicAbstrac{
  @override
  Future<String> loginIn(String? email, String? password) async {
    // TODO: implement loginIn
    //await Future.delayed(Duration(seconds: 2));
    final serviceLogin = new ManageService();
    String token="";
    var response  = await serviceLogin.get('https://jsonplaceholder.typicode.com/albums');
    print(response.statusCode);
    /**then((value) => {
        token = 'token de seguridad recibido',
    }).catchError((error)=>{
      throw Exception('Error personalizado debe ir')
    });**/

    var jsonResponse =  jsonDecode(response.body) as List<dynamic>;
    print(jsonResponse);
    var url =
    Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});

    // Await the http get response, then decode the json-formatted response.
    var response1 = await http.get(url);
    if (response1.statusCode == 200) {
      var jsonResponse =  jsonDecode(response1.body) as Map<String, dynamic>;
      print(jsonResponse);
      var itemCount = jsonResponse['totalItems'];
      print('Number of books about http: $itemCount.');
    } else {
      print('Request failed with status: ${response1.statusCode}.');
    }

    /**if (email != "admin" || password != "admin") {
      throw Exception('Error personalizado debe ir');
    }**/

    return token;
  }

  @override
  Future<String> logoutOut() {
    // TODO: implement logoutOut
    throw UnimplementedError();
  }
  
}