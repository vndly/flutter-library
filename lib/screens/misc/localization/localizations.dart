import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class BaseLocalized {
  String title = '';
  String message(String value) => '';
}

class ENLocalized extends BaseLocalized {
  String title = 'Da title';
  String message(String value) => 'Da message: $value';
}

class ESLocalized extends BaseLocalized {
  String title = 'El titulazo';
  String message(String value) => 'El mesajazo: $value';
}

class Localized {
  static BaseLocalized text;

  static List<Locale> locales = localized.keys.map((l) => Locale(l)).toList();

  static Map<String, BaseLocalized> localized = {
    'en': ENLocalized(),
    'es': ESLocalized()
  };

  static void load(Locale locale) {
    text = localized[locale.languageCode];
  }
}

class CustomLocalizationsDelegate extends LocalizationsDelegate {
  const CustomLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => Localized.locales
      .map((l) => l.languageCode)
      .contains(locale.languageCode);

  @override
  Future load(Locale locale) {
    Localized.load(locale);
    return SynchronousFuture(Object());
  }

  @override
  bool shouldReload(CustomLocalizationsDelegate old) => false;
}