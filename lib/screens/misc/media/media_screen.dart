import 'package:flutter/material.dart';

class MediaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Media'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Pixel ratio: ${data.devicePixelRatio}'),
            const SizedBox(height: 15),
            Text('Orientation: ${data.orientation}'),
            const SizedBox(height: 15),
            Text('Aspect ratio: ${data.size.aspectRatio}'),
            const SizedBox(height: 15),
            Text('Width: ${data.size.width}'),
            const SizedBox(height: 15),
            Text('Height: ${data.size.height}'),
          ],
        ),
      ),
    );
  }
}
