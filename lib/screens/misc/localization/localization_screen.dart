import 'package:flutter/material.dart';
import 'package:flutter_library/screens/app/flutter_library.dart';
import 'package:flutter_library/screens/misc/localization/localizations.dart';
import 'package:provider/provider.dart';

class LocalizationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AppState>(context);
    final locale = Localizations.localeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Localization'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Locale: $locale'),
            Text(Localized.get.title),
            Text(Localized.get.message('Yo!')),
            RaisedButton(
              child: const Text('English'),
              onPressed: () => state.changeLocale(const Locale('en')),
            ),
            RaisedButton(
              child: const Text('Spanish'),
              onPressed: () => state.changeLocale(const Locale('es')),
            ),
          ],
        ),
      ),
    );
  }
}
