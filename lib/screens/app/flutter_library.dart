import 'package:flutter/material.dart';
import 'package:flutter_library/screens/app/flavor_banner.dart';
import 'package:flutter_library/screens/home/home_screen.dart';
import 'package:flutter_library/screens/misc/localization/localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

class FlutterLibrary extends StatelessWidget {
  final AppState state = AppState();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => state,
      child: Consumer<AppState>(
        builder: (context, state, _) => MaterialApp(
              locale: state.locale,
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue,
                buttonTheme: const ButtonThemeData(
                  textTheme: ButtonTextTheme.primary,
                ),
              ),
              home: FlavorBanner(
                child: HomeScreen(),
              ),
              localizationsDelegates: const [
                CustomLocalizationsDelegate(),
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

  AppState() : locale = const Locale('en');

  void changeLocale(Locale newLocale) {
    locale = newLocale;
    notifyListeners();
  }
}
