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
  final Paint _paintBackground;
  final Matrix4 _matrix;

  OpenPainter(this._matrix)
      : _paint = Paint()
          ..style = PaintingStyle.fill
          ..color = Color(0xffff0000)
          ..isAntiAlias = true,
        _paintBackground = Paint()
          ..style = PaintingStyle.fill
          ..color = Color(0xff000000);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.transform(_matrix.storage);

    canvas.drawRect(
        Rect.fromPoints(Offset(0, 0), Offset(size.width, size.height)),
        _paintBackground);

    canvas.drawRect(
        Rect.fromPoints(Offset(100, 100), Offset(300, 300)), _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
