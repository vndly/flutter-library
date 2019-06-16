import 'dart:math';

import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int index = Random().nextInt(100);

    return Scaffold(
      appBar: AppBar(
        title: Text('Image'),
      ),
      body: Center(
        child: FadeInImage.assetNetwork(
          placeholder: 'assets/gifs/loading.gif',
          image: 'https://picsum.photos/500?image=$index',
        ),
      ),
    );
  }
}
