import 'package:flutter/material.dart';

// To set the default font family for the whole app:
/*
 * In the MaterialApp widget:
 * 
 * theme: ThemeData(
 *   fontFamily: 'FONT_NAME'
 * ),
 */
class FontScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Font'),
      ),
      body: Center(
        child: Text(
          'This is some text',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'NotoSerif'
          ),
        ),
      ),
    );
  }
}
