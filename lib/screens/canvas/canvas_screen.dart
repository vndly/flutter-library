import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart';
import 'package:matrix_gesture_detector/matrix_gesture_detector.dart';

class CanvasScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CanvasScreenState();
}

class CanvasScreenState extends State<CanvasScreen> {
  Matrix4 _matrix = Matrix4.identity();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Canvas'),
      ),
      body: MatrixGestureDetector(
        shouldRotate: false,
        onMatrixUpdate: (Matrix4 m, Matrix4 tm, Matrix4 sm, Matrix4 rm) {
          setState(() {
            _matrix = m;
          });
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Color(0xff000000),
          child: CustomPaint(
            painter: OpenPainter(_matrix),
          ),
        ),
      ),
    );
  }
}

class OpenPainter extends CustomPainter {
  final Paint _paint;
  final Matrix4 _matrix;

  OpenPainter(this._matrix)
      : _paint = Paint()
          ..style = PaintingStyle.fill
          ..color = Color(0xffff0000)
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = size.center(Offset.zero);
    double radius = size.width / 8;

    canvas.transform(_matrix.storage);

    canvas.drawCircle(center, radius, _paint);
    canvas.drawCircle(center.translate(radius * 2.5, 0), radius, _paint);
    canvas.drawCircle(center.translate(-radius * 2.5, 0), radius, _paint);

    canvas.drawCircle(
        center.translate(radius * 1.2, -radius * 2.5), radius, _paint);
    canvas.drawCircle(
        center.translate(-radius * 1.2, -radius * 2.5), radius, _paint);

    canvas.drawCircle(
        center.translate(radius * 1.2, radius * 2.5), radius, _paint);
    canvas.drawCircle(
        center.translate(-radius * 1.2, radius * 2.5), radius, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
