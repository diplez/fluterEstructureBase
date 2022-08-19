import 'loginInterface.dart';
import './../../repositorys/manageRepository.dart';

class LoginLogic extends  counterLogicAbstrac{
  @override
  Future<String> loginIn(String email, String password) async {
    // TODO: implement loginIn
    //await Future.delayed(Duration(seconds: 2));
    final repository = new ManageRepository();
    String token;

    await repository.get('https://jsonplaceholder.typicode.com/albums').
    then((value) => {
      token = 'EXITO'
    }).catchError((error)=>{
      throw Exception('Error personalizado debe ir')
    });

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