import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);

  static const delegate = _AppLocalizationsDelegate();

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  Map<dynamic, dynamic> _localizedStrings;

  Future<void> loadJsonLoca() async {
    final jsonString = await rootBundle.loadString('assets_dev/localizations/${locale.languageCode}.json');

    final jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap;
  }

  String translate(String key) => _localizedStrings[key];
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'de', 'pl'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    final localizations = await AppLocalizations(locale);
    await localizations.loadJsonLoca();
    return localizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) => false;
}
