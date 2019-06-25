import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

abstract class BaseLocalized {

  String get title;

  String message(Object value);
}

class ENLocalized extends BaseLocalized {

  @override
  String get title => 'Da title';

  @override
  String message(Object value) => 'Da message: ${value.toString()}';
}

class ESLocalized extends BaseLocalized {

  @override
  String get title => 'El titulazo';

  @override
  String message(Object value) => 'El mesajazo: ${value.toString()}';
}

class Localized {
  static BaseLocalized get;

  static List<Locale> locales = localized.keys.map((l) => Locale(l)).toList();

  static Map<String, BaseLocalized> localized = {
    'en': ENLocalized(),
    'es': ESLocalized()
  };

  static void load(Locale locale) {
    get = localized[locale.languageCode];
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