import '../../statesBloc/StateGeneric.dart';

abstract class RegisterState {
  RegisterState();
}

class RegisterInitState extends RegisterState with StateInitial<dynamic> {}

class RegisterProcessState extends RegisterState with StateInitial<dynamic>{
  RegisterProcessState(){
    loading = true;
  }
}
class RegisterSucessState extends RegisterState with StateInitial<dynamic>{
  RegisterSucessState(){
    loading = false;
  }
}

class RegisterErrorState extends RegisterState with StateInitial<dynamic>{
  RegisterErrorState(){
    loading = false;
  }
}
