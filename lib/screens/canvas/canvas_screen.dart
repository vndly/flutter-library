import 'dart:math';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart';

class CanvasScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CanvasScreenState();
}

class CanvasScreenState extends State<CanvasScreen> {
  double _scale = 1;
  double _previousScale;
  Offset _focal = Offset(0, 0);

  /*void _scaleUpdate(ScaleUpdateDetails scaleDetails) {
    print('${scaleDetails.horizontalScale} ${scaleDetails.verticalScale}');

    double horizontal = max(scaleDetails.horizontalScale, 1);
    double vertical = max(scaleDetails.verticalScale, 1);

    setState(() {
      _scale = max(horizontal, vertical);
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Canvas'),
      ),
      body: GestureDetector(
        onScaleStart: (ScaleStartDetails details) {
          _previousScale = _scale;
        },
        onScaleUpdate: (ScaleUpdateDetails details) {
          setState(() {
            _focal = details.focalPoint;
            _scale = _previousScale * details.scale;
          });
        },
        onScaleEnd: (ScaleEndDetails details) {
          _previousScale = null;
        },
        child: Container(
          width: 1000,
          height: 1000,
          color: Color(0xff00ff00),
          child: Transform(
            transform: Matrix4.diagonal3(new Vector3(_scale, _scale, _scale))
              ..translate(_focal.dx, _focal.dy),
            alignment: FractionalOffset.center,
            child: CustomPaint(
              painter: OpenPainter(_scale),
            ),
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
          ..color = Color(0xffff0000)
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Size size) {
    //canvas.scale(_scale);
    canvas.drawRect(
        Rect.fromPoints(Offset(100, 100), Offset(300, 300)), _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
