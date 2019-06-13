import 'package:flutter/material.dart';

class BackgroundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Background'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.8), BlendMode.dstATop),
            image: AssetImage('assets/images/background.jpg'),
          ),
        ),
        child: Center(
          child: Text('Some Title'),
        ),
      ),
    );
  }
}
