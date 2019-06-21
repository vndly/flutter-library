import 'package:flutter/material.dart';
import 'package:flutter_library/main.dart';
import 'package:flutter_library/screens/misc/localization/localizations.dart';
import 'package:provider/provider.dart';

class LocalizationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppState state = Provider.of<AppState>(context);

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
            RaisedButton(
              child: Text('English'),
              onPressed: () => state.changeLocale(Locale('en')),
            ),
            RaisedButton(
              child: Text('Spanish'),
              onPressed: () => state.changeLocale(Locale('es')),
            ),
          ],
        ),
      ),
    );
  }
}
