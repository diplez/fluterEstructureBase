import 'package:flutter/cupertino.dart';
import 'RoleModel.dart';

/**
 *  Usuario
 */
class User {
  int id;
  String username;
  String password;
  Rol roles;

  User({required this.id,required this.username,required this.password,required this.roles});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'password': password,
      'rol_id': roles.id
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      username: json['username'] as String,
      password: json['password'] as String,
      roles: json['roles'] as Rol
    );
  }

  factory User.fromMap(Map<String, dynamic> json) => new User(
    id: json['id'] as int,
    username: json['username'] as String,
    password: json['password'] as String,
    roles: json['roles'] as Rol
  );
}