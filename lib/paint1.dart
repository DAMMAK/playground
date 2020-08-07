import 'dart:math' as math;
import 'dart:math';

import 'package:flutter/material.dart';

class Painting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Center(
        child: Container(
          // height: height * 0.4,
          // width: width * 0.8,
          color: Colors.orange,
          child: CustomPaint(
            painter: DominosPainter(),
          ),
        ),
      ),
    );
  }
}

class RandomPainter extends CustomPainter {
  var _rad = 20.0;
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.orange;

    for (int i = 0; i <= 1000; i++) {
      // var offset = Offset(20, 20);
      var radius = Random().nextDouble() * _rad;
      var off = math.Random().nextDouble() * _rad;
      print(radius);

      var offset = Offset(math.tan(off) * 1000, math.tan(off) * 1000);
      var path = Path();
      // path.moveTo(x, y);

      _drawCiricle(
          canvas: canvas, offset: offset, paint: paint, radius: radius);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  void _drawCiricle(
      {Canvas canvas, Offset offset, Paint paint, double radius}) {
    canvas.drawCircle(offset, radius, paint);
  }
}

class DominosPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    print(size);
    Paint paint = Paint()..color = Color(0XFFE31836);
    var rect1 = Rect.fromLTWH(size.width / 2, size.height / 2, 70, 60);
    var rect2 = Rect.fromLTWH((size.width / 2) - 75, size.height / 2, 70, 60);
    canvas.rotate(100);
    canvas.drawRect(rect1, paint);
    paint.color = Colors.white;
    canvas.drawCircle(Offset(35, 29), 15.0, paint);
    paint.color = Color(0XFF0179AE);
    canvas.drawRect(rect2, paint);
    paint.color = Colors.white;
    canvas.drawCircle(Offset(-52, 20), 10.0, paint);
    canvas.drawCircle(Offset(-27, 40), 10.0, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
