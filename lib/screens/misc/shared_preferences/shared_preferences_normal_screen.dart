import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesNormalScreen extends StatefulWidget {
  static MaterialPageRoute<T> instance<T>() {
    return MaterialPageRoute(
      builder: (context) => SharedPreferencesNormalScreen(),
    );
  }

  @override
  _SharedPreferencesNormalScreenState createState() =>
      _SharedPreferencesNormalScreenState();
}

class _SharedPreferencesNormalScreenState
    extends State<SharedPreferencesNormalScreen> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    loadCounter();
  }

  Future loadCounter() async {
    final preferences = await SharedPreferences.getInstance();
    _counter = preferences.getInt('counter') ?? 0;

    setState(() {});
  }

  Future saveCounter(int counter) async {
    final preferences = await SharedPreferences.getInstance();
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shared Preferences Normal'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: const Icon(Icons.add),
      ),
    );
  }
}
