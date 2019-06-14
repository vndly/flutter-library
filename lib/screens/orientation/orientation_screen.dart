import 'package:flutter/material.dart';

/*
 * To fix the orientation of the app:
 * 
 * @override
 * Widget build(BuildContext context) {
 *   SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
 *   return MaterialApp(...);
 */
class OrientationScreen extends StatelessWidget {
  Widget _portraitLayout() {
    return Container(
      color: Colors.blue,
    );
  }

  Widget _landscapeLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.red,
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.green,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orientation'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? _portraitLayout()
              : _landscapeLayout();
        },
      ),
    );
  }
}
