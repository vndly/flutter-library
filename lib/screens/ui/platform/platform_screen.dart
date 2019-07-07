import 'package:dafluta/dafluta.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformScreen extends StatefulWidget {
  @override
  _PlatformScreenState createState() => _PlatformScreenState();
}

class _PlatformScreenState extends State<PlatformScreen> {
  bool switchSelected = true;
  double sliderValue = 50;
  bool asAndroid = true;

  void _changeOS(bool android) {
    setState(() {
      asAndroid = android;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Platform'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => _changeOS(!asAndroid),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Platform: ${asAndroid ? 'Android' : 'iOS'}'),
            const VBox(20),
            Switch.adaptive(
              value: switchSelected,
              onChanged: (value) {
                setState(() {
                  switchSelected = value;
                });
              },
            ),
            const VBox(20),
            asAndroid
                ? const CircularProgressIndicator()
                : CupertinoActivityIndicator(),
            const VBox(20),
            asAndroid
                ? RaisedButton(
                    onPressed: () {},
                    child: const Text('Android button'),
                  )
                : CupertinoButton(
                    onPressed: () {},
                    color: Colors.blue,
                    child: const Text('iOS button'),
                  ),
            const VBox(20),
            asAndroid
                ? Slider(
                    onChanged: (value) {
                      setState(() {
                        sliderValue = value;
                      });
                    },
                    value: sliderValue,
                    min: 0,
                    max: 100,
                  )
                : CupertinoSlider(
                    onChanged: (value) {
                      setState(() {
                        sliderValue = value;
                      });
                    },
                    value: sliderValue,
                    min: 0,
                    max: 100,
                  ),
          ],
        ),
      ),
    );
  }
}
