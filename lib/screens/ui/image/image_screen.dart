import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image'),
      ),
      body: Center(
        child: image2(),
      ),
    );
  }

  Widget image1() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: FadeInImage.assetNetwork(
        placeholder: 'assets/gifs/loading.gif',
        image: url(),
      ),
    );
  }

  Widget image2() {
    return CachedNetworkImage(
      imageUrl: url(),
      imageBuilder: (context, imageProvider) => SizedBox(
        width: 200,
        height: 200,
        child: Image(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
      placeholder: (context, url) => SizedBox(
        width: 200,
        height: 200,
        child: Container(
          color: Colors.grey[300],
          child: Center(
            child: const CircularProgressIndicator(),
          ),
        ),
      ),
      errorWidget: (context, url, error) => SizedBox(
        width: 200,
        height: 200,
        child: Container(
          color: Colors.grey[300],
          child: Center(
            child: Icon(Icons.error),
          ),
        ),
      ),
    );
  }

  String url() {
    final index = Random().nextInt(100);

    return 'https://picsum.photos/250?image=$index';
  }
}
