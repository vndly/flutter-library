import 'dart:io';
import 'package:flutter/material.dart';

class PlatformScreen extends StatefulWidget {
  @override
  _PlatformScreenState createState() => _PlatformScreenState();
}

class _PlatformScreenState extends State<PlatformScreen> {
  bool switchSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Platform: ${Platform.operatingSystem}'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Switch.adaptive(
              value: switchSelected,
              onChanged: (value) {
                setState(() {
                  switchSelected = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
