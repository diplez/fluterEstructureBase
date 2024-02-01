/**
 *  Rol
 */
class Rol {

  int id = 0;
  late String code;
  late String name;

  Rol({required this.id,required this.code,required this.name});

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