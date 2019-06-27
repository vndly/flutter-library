import 'dart:math';

import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final index = Random().nextInt(100);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Image'),
      ),
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: FadeInImage.assetNetwork(
            placeholder: 'assets/gifs/loading.gif',
            image: 'https://picsum.photos/250?image=$index',
          ),
        ),
      ),
    );
  }
}
