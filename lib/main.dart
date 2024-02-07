import 'package:hive/hive.dart';
import 'package:restitution/src/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:restitution/src/domains/configs/hive_configs.dart';
import 'package:restitution/src/domains/configs/loading_configs.dart';
import 'package:restitution/src/domains/constants/const_application.dart';
import 'package:restitution/src/domains/models/Auth/user_model.dart';

void main() async {

  final FlutterI18nDelegate flutterI18nDelegate = FlutterI18nDelegate(
      translationLoader: FileTranslationLoader(
          useCountryCode: false,
          fallbackFile: 'es',
          basePath: 'assets/i18n',
          forcedLocale: Locale('es'))
  );
  WidgetsFlutterBinding.ensureInitialized();

  // Inicia Hive
  await initHive();
  
  runApp(App(flutterI18nDelegate));
  configLoading();
}