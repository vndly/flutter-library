import 'package:flutter/material.dart';

class MediaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Media'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Pixel ratio: ${data.devicePixelRatio}'),
            SizedBox(height: 15),
            Text('Orientation: ${data.orientation}'),
            SizedBox(height: 15),
            Text('Aspect ratio: ${data.size.aspectRatio}'),
            SizedBox(height: 15),
            Text('Width: ${data.size.width}'),
            SizedBox(height: 15),
            Text('Height: ${data.size.height}'),
          ],
        ),
      ),
    );
  }
}
