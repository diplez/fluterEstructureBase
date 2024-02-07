import 'RoleModel.dart';
import 'package:hive/hive.dart';
part 'adapters/user_model.g.dart';
/**
 *  Usuario
 */
@HiveType(typeId: 1)
class UserModel{
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? username;

  @HiveField(2)
  String? password;

  @HiveField(3)
  Rol? roles;

  UserModel({this.id,this.username,this.password,this.roles});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'password': password,
      'rol_id': roles?.id
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      username: json['username'] as String,
      password: json['password'] as String,
      roles: json['roles'] as Rol
    );
  }

  factory UserModel.fromMap(Map<String, dynamic> json) => new UserModel(
    id: json['id'] as int,
    username: json['username'] as String,
    password: json['password'] as String,
    roles: json['roles'] as Rol
  );
}