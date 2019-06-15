import 'package:flutter/material.dart';

class CanvasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Canvas'),
      ),
      body: Container(
          child: CustomPaint(
        painter: OpenPainter(),
      )),
    );
  }
}

class OpenPainter extends CustomPainter {
  final Paint _paint;

  OpenPainter()
      : _paint = Paint()
          ..style = PaintingStyle.fill
          ..color = Colors.blue
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(
        Rect.fromPoints(Offset(100, 100), Offset(200, 300)), _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
