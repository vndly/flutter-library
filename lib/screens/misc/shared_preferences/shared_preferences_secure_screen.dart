import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SharedPreferencesSecureScreen extends StatefulWidget {
  static MaterialPageRoute<T> instance<T>() {
    return MaterialPageRoute(
      builder: (context) => SharedPreferencesSecureScreen(),
    );
  }

  @override
  _SharedPreferencesSecureScreenState createState() =>
      _SharedPreferencesSecureScreenState();
}

class _SharedPreferencesSecureScreenState
    extends State<SharedPreferencesSecureScreen> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    loadCounter();
  }

  void loadCounter() async {
    var preferences = FlutterSecureStorage();
    _counter = int.parse(await preferences.read(key: 'counter')) ?? 0;

    setState(() {});
  }

  void saveCounter(int counter) async {
    var preferences = FlutterSecureStorage();
    preferences.write(key: 'counter', value: counter.toString());
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      saveCounter(_counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Shared Preferences Normal'),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        child: new Icon(Icons.add),
      ),
    );
  }
}
