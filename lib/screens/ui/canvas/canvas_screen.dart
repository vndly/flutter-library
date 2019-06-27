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
        title: const Text('Canvas'),
      ),
      body: MatrixGestureDetector(
        shouldRotate: false,
        onMatrixUpdate: (Matrix4 m, Matrix4 tm, Matrix4 sm, Matrix4 rm) {
          setState(() {
            final Matrix4 temp = _matrix * sm;
            final Vector3 scale = Vector3(0, 0, 0);
            temp.decompose(Vector3(0, 0, 0), Quaternion(0, 0, 0, 0), scale);

            if (scale.x >= 1) {
              _matrix = temp;
            }

            _matrix = _matrix * tm;
          });
        },
        child: GestureDetector(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: const Color(0xff000000),
            child: CustomPaint(
              painter: OpenPainter(_matrix),
            ),
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
          ..color = const Color(0xffff0000)
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = size.width / 8;

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

  @override
  bool hitTest(Offset position) {
    final point = offsetTransformed(_matrix, position);
    print('hit: $point');

    return false;
  }

  Offset offsetTransformed(Matrix4 transform, Offset point) {
    final inverse = Matrix4.tryInvert(transform);

    if (inverse == null) {
      return point;
    } else {
      return MatrixUtils.transformPoint(inverse, point);
    }
  }
}
