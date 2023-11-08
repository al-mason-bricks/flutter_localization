import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AppTranslation {
  static const all = [
    english,
    arabic,
  ];

  static const Locale english = Locale('en');

  static const Locale arabic = Locale('ar');

  static Future<void> setLocal(Locale locale) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString('locale', locale.languageCode);
  }

  static Future<Locale> getLocale() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final String locale = sharedPreferences.getString('locale') ?? 'en';
    return Locale(locale);
  }
}
