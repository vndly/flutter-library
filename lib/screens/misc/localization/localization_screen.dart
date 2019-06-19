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
          ],
        ),
      ),
    );
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
  Future<Localized> load(Locale locale) =>
      SynchronousFuture<Localized>(Localized(locale));

  @override
  bool shouldReload(DemoLocalizationsDelegate old) => false;
}
