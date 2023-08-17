import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:translate_app/design.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;
    return MaterialApp(
        title: translate('title'),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          localizationDelegate
        ],
        supportedLocales: localizationDelegate.supportedLocales,
        localeResolutionCallback: (locale, supportedLocales) =>
            localizationDelegate.fallbackLocale,
        home: const HomePage());
  }
}
