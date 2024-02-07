// hive_config.dart
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:restitution/src/domains/models/Auth/user_model.dart';
import 'package:encrypt/encrypt.dart';

Future<void> initHive() async {
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);

  // Registra todos los adaptadores
  Hive.registerAdapter(UserModelAdapter());
  
  /**
   *
      final box = await Hive.openBox(DB_USERS); Crea el nomre de la tabla
      final user = UserModel(id: 1, username: 'John Doe', password: 'dsadsa');
      box.put(user.id, user); --Guardas en base a la llave y los datos
   */
}
