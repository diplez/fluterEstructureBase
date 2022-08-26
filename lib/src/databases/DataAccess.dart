import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataAccess{

  String SQL_Activate_Enforce_Relations = "PRAGMA foreign_keys = ON";
  String SQL_C_Table_User = "CREATE TABLE user("
                                    "id INTEGER PRIMARY KEY autoincrement,"
                                    "username TEXT not null,"
                                    "password TEXT not null,"
                                    "rol_id INTEGER not null)";
                                    //"CONSTRAINT fk_rol";
                                    //"FOREIGN KEY (rol_id)"
                                    //"REFERENCES rol(id))"; //"FOREIGN KEY(rol_id) REFERENCES rol(id)
  String SQL_C_Table_Rol = "CREATE TABLE rol(id INTEGER PRIMARY KEY autoincrement, code TEXT not null, name TEXT not null)";
  Database? _database;

  Future<Database> get database async {
    if (_database!=null) return _database!;
    _database = await getDatabaseInstance();
    return _database!;
  }

  Future<void> _onConfigure(Database db) async {
    await db.execute(SQL_Activate_Enforce_Relations);
  }

  Future<Database> getDatabaseInstance() async {
    String path = join(await getDatabasesPath(), 'genusAcademico.db');
    return (await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await db.execute(SQL_C_Table_User);
          await db.execute(SQL_C_Table_Rol);
    },
        onConfigure:_onConfigure
    ));
  }
}