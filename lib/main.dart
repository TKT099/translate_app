import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:translate_app/myapp.dart';

void main() async {
  var delegate = await LocalizationDelegate.create(
    fallbackLocale: 'en_US',
    supportedLocales: ['en_US', 'es'],
  );
  runApp(LocalizedApp(delegate, const MyApp()));
}
