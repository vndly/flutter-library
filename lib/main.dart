import 'package:flutter/material.dart';
import 'package:flutter_library/screens/home/home_screen.dart';
import 'package:flutter_library/screens/misc/localization/localization_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        buttonTheme: const ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: Stack(
        fit: StackFit.expand,
        children: [
          HomeScreen(),
          Banner(
            message: 'Custom',
            location: BannerLocation.topEnd,
          ),
        ],
      ),
      localizationsDelegates: [
        const DemoLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: Localized.locales(),
    );
  }
}
