/**
 *  Rol
 */
class Rol {

  int id;
  String code;
  String name;

  Rol({this.id,this.code, this.name});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'code': code,
      'name': name,
    };
  }

  factory Rol.fromJson(Map<String, dynamic> json) {
    return Rol(
      id: json['id'] as int,
      code: json['code'] as String,
      name: json['name'] as String
    );
  }

  factory Rol.fromMap(Map<String, dynamic> json) => new Rol(
    id: json['id'] as int,
    code: json['code'] as String,
    name: json['name'] as String
  );
}