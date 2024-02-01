/**
 * Estado inicial de blocs
 */
abstract class StateInitial<T>{
  T? result;
  bool success=false;
  dynamic error;
  bool loading=false;
}