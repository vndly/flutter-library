import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

abstract class BaseLocalized {
  String get title;

  String message(String param1);
}

class ENLocalized extends BaseLocalized {
  @override
  String get title => 'Da title';

  @override
  String message(String param1) => 'Da message: ${param1.toString()}';
}

class ESLocalized extends BaseLocalized {
  @override
  String get title => 'El titulazo';

  @override
  String message(String param1) => 'El mesajazo: ${param1.toString()}';
}

class Localized {
  static BaseLocalized get;
  static Locale current;

  static List<Locale> locales =
      localized.keys.map((String l) => Locale(l)).toList();

  static Map<String, BaseLocalized> localized = <String, BaseLocalized>{
    'en': ENLocalized(),
    'es': ESLocalized()
  };

  static bool isSupported(Locale locale) =>
      locales.map((Locale l) => l.languageCode).contains(locale.languageCode);

  static void load(Locale locale) {
    current = locale;
    get = localized[locale.languageCode];
  }
}

class CustomLocalizationsDelegate extends LocalizationsDelegate<dynamic> {
  const CustomLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => Localized.isSupported(locale);

  @override
  Future<dynamic> load(Locale locale) {
    Localized.load(locale);
    return SynchronousFuture<dynamic>(Object());
  }

  @override
  bool shouldReload(CustomLocalizationsDelegate old) => false;
}
