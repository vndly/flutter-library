import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RichTextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image'),
      ),
      body: Center(
        child: RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
            children: [
              TextSpan(
                text: 'You can find more information ',
              ),
              TextSpan(
                text: 'here',
                style: TextStyle(
                  color: Colors.blue,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => print('Tapped!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
