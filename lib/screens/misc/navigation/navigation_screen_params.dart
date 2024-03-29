import 'package:flutter/material.dart';
import 'package:flutter_library/screens/misc/navigation/navigation_screen_alone.dart';

class NavigationScreenParams extends StatelessWidget {
  final String value;

  const NavigationScreenParams(this.value);

  static MaterialPageRoute<T> instance<T>(String value) {
    return MaterialPageRoute(
      builder: (context) => NavigationScreenParams(value),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.of(context).pop('Canceled');
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(value),
        ),
        body: Center(
          child: Column(
            children: [
              RaisedButton(
                onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                    NavigationScreenAlone.instance(), (route) => false),
                child: const Text('Push and remove all'),
              ),
              RaisedButton(
                onPressed: () => Navigator.of(context).pop('Bye!'),
                child: const Text('Go back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
