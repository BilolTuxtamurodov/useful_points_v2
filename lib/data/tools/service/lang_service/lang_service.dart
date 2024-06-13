import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usefulpoints/data/storage/app/locals/lang_prefs/language_prefs.dart';
import 'package:usefulpoints/data/storage/app/locals/languages/en_EN.dart';
import 'package:usefulpoints/data/storage/app/locals/languages/fr_FR.dart';
import 'package:usefulpoints/data/storage/app/locals/languages/ru_RU.dart';
import 'package:usefulpoints/data/storage/app/locals/languages/uz_UZ.dart';

class LangService extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'ru_RU': ruRU, // lang/ru_RU.dart
    'uz_UZ': uzUZ, // lang/uz_UZ.dart
    'en_EN': enEN, // lang/en_EN.dart
    'fr_FR': frFR // lang/fr_FR.dart
  };

  static const fallbackLocale = Locale('uz', 'UZ');

  static final langs = ['ru', 'uz', 'fr', 'en'];

  static final List<Locale> locales = [
    const Locale('ru', 'RU'),
    const Locale('uz', 'UZ'),
    const Locale('fr', 'FR'),
    const Locale('en', 'EN'),
  ];

  static Locale defaultLanguage() {
    var lan = Get.find<LangPrefs>().lang;
    if (lan == "ru") return defLanguage('ru');
    if (lan == "uz") return defLanguage('uz');
    if (lan == "en") return defLanguage('en');
    if (lan == "fr") return defLanguage('fr');
    return defLanguage('uz');
  }

  static Locale defLanguage(String code) {
    var index = langs.indexOf(code);
    return locales[index];
  }

  static void changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    if (locale != null) {
      Get.updateLocale(locale);
      Get.find<LangPrefs>().lang = lang;
    }
  }

  static Locale? _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.deviceLocale;
  }
}
