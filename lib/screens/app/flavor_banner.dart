import 'package:flutter/material.dart';
import 'package:flutter_library/resources/environments.dart';
import 'package:flutter_library/resources/locator.dart';
import 'package:flutter_library/screens/app/app_config.dart';

class FlavorBanner extends StatelessWidget {
  final Widget child;

  const FlavorBanner({@required this.child});

  @override
  Widget build(BuildContext context) {
    final environment = getIt<Environment>();

    if (environment.isProd) {
      return child;
    }

    return Stack(
      fit: StackFit.expand,
      children: [
        child,
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          child: Banner(
            message: environment.name.toUpperCase(),
            location: BannerLocation.topEnd,
            color: Colors.red,
          ),
          onLongPress: () {
            showDialog(
              context: context,
              builder: (context) => AppConfig(),
            );
          },
        ),
      ],
    );
  }
}
