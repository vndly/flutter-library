import 'package:flutter/material.dart';
import 'package:flutter_library/screens/home/home_screen.dart';
import 'package:flutter_library/screens/misc/localization/localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppState state = AppState();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => state,
      child: Consumer<AppState>(
        builder: (context, AppState state, _) => MaterialApp(
              locale: state.locale,
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
                const CustomLocalizationsDelegate(),
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: Localized.locales,
            ),
      ),
    );
  }
}

class AppState extends ChangeNotifier {
  Locale locale;

  AppState() : locale = Locale('en');

  void changeLocale(Locale newLocale) {
    locale = newLocale;
    notifyListeners();
  }
}
