import 'package:contarz/src/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main(){
  final FlutterI18nDelegate flutterI18nDelegate = FlutterI18nDelegate(
    translationLoader: FileTranslationLoader(
        useCountryCode: false,
        fallbackFile: 'es',
        basePath: 'assets/i18n',
        forcedLocale: Locale('es'))
  );
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App(flutterI18nDelegate));
}