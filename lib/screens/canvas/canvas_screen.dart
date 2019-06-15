import 'dart:math';

import 'package:flutter/material.dart';

class CanvasScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CanvasScreenState();
}

class CanvasScreenState extends State<CanvasScreen> {
  double _scale = 1;

  void _scaleUpdate(ScaleUpdateDetails scaleDetails) {
    print('${scaleDetails.horizontalScale} ${scaleDetails.verticalScale}');

    double horizontal = max(scaleDetails.horizontalScale, 1);
    double vertical = max(scaleDetails.verticalScale, 1);

    setState(() {
      _scale = max(horizontal, vertical);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Canvas'),
      ),
      body: GestureDetector(
        onScaleUpdate: _scaleUpdate,
        child: Container(
          width: 1000,
          height: 1000,
          color: Colors.red,
          child: CustomPaint(
            painter: OpenPainter(_scale),
          ),
        ),
      ),
    );
  }
}

class OpenPainter extends CustomPainter {
  final Paint _paint;
  final double _scale;

  OpenPainter(this._scale)
      : _paint = Paint()
          ..style = PaintingStyle.fill
          ..color = Colors.blue
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.scale(_scale);
    canvas.drawRect(
        Rect.fromPoints(Offset(100, 100), Offset(300, 300)), _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
