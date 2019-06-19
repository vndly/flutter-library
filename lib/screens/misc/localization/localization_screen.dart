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
            Text(Localized.of(context).title),
            Text(SuperLocalized.title),
            Text(SuperLocalized.message('Yo!')),
            Text(SuperLocalized.minutes(0)),
            Text(SuperLocalized.minutes(1)),
            Text(SuperLocalized.minutes(3)),
          ],
        ),
      ),
    );
  }
}

class SuperLocalized {
  static String title = '';
  static Function message = (String value) => '';
  static Function minutes = (num value) => '';

  static void load(Locale locale) {
    if (locale.languageCode == 'es') {
      SuperLocalized.title = 'El titulazo';
      SuperLocalized.message = (String value) => 'El mesajazo: $value';
      SuperLocalized.minutes = (num value) {
        if (value == 0) {
          return 'Sin minutos';
        } else if (value == 1) {
          return '1 minuto';
        } else {
          return '$value minutazos';
        }
      };
    } else if (locale.languageCode == 'en') {
      SuperLocalized.title = 'Da title';
      SuperLocalized.message = (String value) => 'Da message: $value';
      SuperLocalized.minutes = (num value) {
        if (value == 0) {
          return 'No minutes';
        } else if (value == 1) {
          return '1 minute';
        } else {
          return '$value minutes';
        }
      };
    }
  }
}

class Localized {
  final Locale _locale;

  Localized(this._locale);

  static List<Locale> locales() => [
        const Locale('en'),
        const Locale('es'),
      ];

  static Localized of(BuildContext context) =>
      Localizations.of<Localized>(context, Localized);

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'title': 'Hello World',
    },
    'es': {
      'title': 'Hola Mundo',
    },
  };

  String get title => _localizedValues[_locale.languageCode]['title'];
}

class DemoLocalizationsDelegate extends LocalizationsDelegate<Localized> {
  const DemoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => Localized.locales()
      .map((l) => l.languageCode)
      .contains(locale.languageCode);

  @override
  Future<Localized> load(Locale locale) {
    SuperLocalized.load(locale);

    return SynchronousFuture<Localized>(Localized(locale));
  }

  @override
  bool shouldReload(DemoLocalizationsDelegate old) => false;
}
