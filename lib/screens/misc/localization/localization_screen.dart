import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LocalizationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Localization'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(Localized.text.title),
            Text(Localized.text.message('Yo!')),
            Text(Localized.text.minutes(0)),
            Text(Localized.text.minutes(1)),
            Text(Localized.text.minutes(3)),
          ],
        ),
      ),
    );
  }
}

class Localized {
  static BaseLocalized text;

  static List<Locale> locales() =>
      localized.keys.map((l) => Locale(l)).toList();

  static Map<String, BaseLocalized> localized = {
    'en': EnglishLocalized(),
    'es': SpanishLocalized()
  };

  static void load(Locale locale) {
    text = localized[locale.languageCode] ?? EnglishLocalized();
  }
}

class EnglishLocalized extends BaseLocalized {
  String title = 'Da title';

  String message(String value) => 'Da message: $value';

  String minutes(num value) {
    if (value == 0) {
      return 'No minutes';
    } else if (value == 1) {
      return '1 minute';
    } else {
      return '$value minutes';
    }
  }
}

class SpanishLocalized extends BaseLocalized {
  String title = 'El titulazo';

  String message(String value) => 'El mesajazo: $value';

  String minutes(num value) {
    if (value == 0) {
      return 'Sin minutos';
    } else if (value == 1) {
      return '1 minuto';
    } else {
      return '$value minutazos';
    }
  }
}

class BaseLocalized {
  String title = '';

  String message(String value) => '';

  String minutes(num value) => '';
}

class DemoLocalizationsDelegate extends LocalizationsDelegate {
  const DemoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => Localized.locales()
      .map((l) => l.languageCode)
      .contains(locale.languageCode);

  @override
  Future load(Locale locale) {
    Localized.load(locale);

    return SynchronousFuture(Object());
  }

  @override
  bool shouldReload(DemoLocalizationsDelegate old) => false;
}
