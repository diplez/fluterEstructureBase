
import '../databases/DataAccess.dart';
import '../models/UserModel.dart';
import 'package:sqflite/sqflite.dart';

class UserDao{

  UserDao();

  Future<void> insertUser(User user) async {
    final db = await DataAccess().database;

    await db.insert(
        'rol',
        user.roles.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    await db.insert(
      'user',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    final List<Map<String, dynamic>> maps = await db.query('user');

    final List<Map<String, dynamic>> mapsUsers = await db.query('user');
    final List<Map<String, dynamic>> mapsRoles = await db.query('rol');

    print("AQUI SE IMPRIME DATOS DE BASE"+mapsUsers.toString());
    print("AQUI SE IMPRIME DATOS DE BASE"+mapsRoles.toString());
    /**
    return List.generate(maps.length, (i) {
      return User(
        id: maps[i]['id'],
        username: maps[i]['name'],
        roles: roles buscados con nueva consulta para que sea accesible del objto,
      );
    });**/
  }
}