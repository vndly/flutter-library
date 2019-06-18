import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesScreen extends StatefulWidget {
  @override
  _SharedPreferencesScreenState createState() =>
      _SharedPreferencesScreenState();
}

class _SharedPreferencesScreenState extends State<SharedPreferencesScreen> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    loadCounter();
  }

  void loadCounter() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _counter = preferences.getInt('counter') ?? 0;

    setState(() {});
  }

  void saveCounter(int counter) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt('counter', counter);
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
        title: new Text('Shared Preferences'),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
