import 'package:flutter/material.dart';
import 'package:flutter_library/screens/misc/localization/localizations.dart';

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
          ],
        ),
      ),
    );
  }
}
