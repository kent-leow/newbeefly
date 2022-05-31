import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:newbeefly/shared/constant/constants.dart';

class TranslationService extends Translations {
  static final TranslationService _singleton = TranslationService._internal();

  factory TranslationService() {
    return _singleton;
  }

  TranslationService._internal();

  final Map<String, Map<String, String>> translations = {};

  Future<void> loadAssets() async {
    const List<String> availableLanguages = Constants.availableLocales;
    for (String availableLanguage in availableLanguages) {
      Map<String, String> languageJson =
          json.decode(await rootBundle.loadString('locales/$availableLanguage.json')).cast<String, String>();
      translations[availableLanguage] = languageJson;
    }
  }

  @override
  Map<String, Map<String, String>> get keys => translations;
}
