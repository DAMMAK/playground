import 'dart:math';

import 'package:flutter/material.dart';

class WhotCard extends StatefulWidget {
  @override
  _WhotCardState createState() => _WhotCardState();
}

class _WhotCardState extends State<WhotCard> {
  int length = 14;
  final double _cardheight = 400;
  final double _cardWidth = 350;
  int _value = 1;
  PageController _controller = PageController(initialPage: 0);
  void generateNumber() {
    for (int i = 0; i < length; i++) {
      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          _value = Random().nextInt(length + 1);
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    generateNumber();
  }

  @override
  Widget build(BuildContext context) {
    //       double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30),
            width: width,
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: _cardheight,
                        width: _cardWidth,
                        child: CustomPaint(
                          painter: Circle(numberValue: 10),
                        ),
                      ),
                      Container(
                        height: _cardheight,
                        width: _cardWidth,
                        child: CustomPaint(
                          painter: Triangle(numberValue: 12),
                        ),
                      ),
                    ]),
                SizedBox(height: 30),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: _cardheight,
                        width: _cardWidth,
                        child: CustomPaint(
                          painter: Rectangle(numberValue: 14),
                        ),
                      ),
                      Container(
                        height: _cardheight,
                        width: _cardWidth,
                        child: CustomPaint(
                          painter: Cross(numberValue: 5),
                        ),
                      ),
                    ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Circle extends CustomPainter {
  final int numberValue;
  Circle({@required this.numberValue});
  @override
  void paint(Canvas canvas, Size size) {
    Color _color = Color(0XFF810F0F);
    Paint paint = Paint()..color = Colors.grey.withAlpha(100);
    final double width = size.width;
    final double height = size.height;
    Rect _cardBody = Rect.fromLTWH(0, 0, width, height);

    RRect cardBody = RRect.fromRectAndRadius(_cardBody, Radius.circular(10.0));
    canvas.drawRRect(cardBody, paint);
    paint.color = _color;

    canvas.drawCircle(Offset(width / 2, height / 2), height * 0.3, paint);
    TextPainter textPainter = TextPainter(
        text: TextSpan(
            text: numberValue.toString(),
            style: TextStyle(fontSize: 40.0, color: _color)),
        textDirection: TextDirection.ltr);
    textPainter.layout(minWidth: 0, maxWidth: 50);
    textPainter.paint(canvas, Offset(width * 0.02, height * 0.01));

    textPainter.paint(canvas, Offset(width * 0.85, height - 60));
    canvas.drawCircle(Offset(34, 80), 20.0, paint);
    canvas.drawCircle(Offset(width * 0.9, height * 0.8), 20.0, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class Rectangle extends CustomPainter {
  final int numberValue;
  Rectangle({@required this.numberValue});
  @override
  void paint(Canvas canvas, Size size) {
    Color _color = Color(0XFF810F0F);
    Paint paint = Paint()..color = Colors.grey.withAlpha(100);
    final double width = size.width;
    final double height = size.height;
    Rect _cardBody = Rect.fromLTWH(0, 0, width, height);

    RRect cardBody = RRect.fromRectAndRadius(_cardBody, Radius.circular(10.0));
    canvas.drawRRect(cardBody, paint);
    paint.color = _color;
    Rect rect =
        Rect.fromLTWH((width / 2) - 140, 100, height * 0.6, height * 0.55);
    canvas.drawRect(rect, paint);
    TextPainter textPainter = TextPainter(
        text: TextSpan(
            text: numberValue.toString(),
            style: TextStyle(fontSize: 40.0, color: _color)),
        textDirection: TextDirection.ltr);
    textPainter.layout(minWidth: 0, maxWidth: 50);
    textPainter.paint(canvas, Offset(width * 0.04, height * 0.025));

    textPainter.paint(canvas, Offset(width - 60, height - 60));
    var smallRect = Rect.fromLTWH(20, 60, height * 0.07, height * 0.07);
    var smallRect2 =
        Rect.fromLTWH(width - 60, height - 95, height * 0.07, height * 0.07);

    canvas.drawRect(smallRect, paint);
    canvas.drawRect(smallRect2, paint);
    // canvas.drawRect(Offset(width - 30, height * 0.8), 20.0, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class Triangle extends CustomPainter {
  final int numberValue;
  Triangle({@required this.numberValue});
  @override
  void paint(Canvas canvas, Size size) {
    Color _color = Color(0XFF810F0F);
    Paint paint = Paint()..color = Colors.grey.withAlpha(100);
    final double width = size.width;
    final double height = size.height;
    Rect _cardBody = Rect.fromLTWH(0, 0, width, height);

    RRect cardBody = RRect.fromRectAndRadius(_cardBody, Radius.circular(10.0));
    canvas.drawRRect(cardBody, paint);
    paint.color = _color;
    Path path = Path();
    path.moveTo(width / 2, 50);
    path.lineTo(20, height * 0.7);
    path.lineTo(width - 20, height * 0.7);
    // path.lineTo(x, y)
    path.close();
    canvas.drawPath(path, paint);
    // text Painter
    TextPainter textPainter = TextPainter(
        text: TextSpan(
            text: numberValue.toString(),
            style: TextStyle(fontSize: 40.0, color: _color)),
        textDirection: TextDirection.ltr);
    textPainter.layout(minWidth: 0, maxWidth: 50);

    textPainter.paint(canvas, Offset(width * 0.04, height * 0.025));
    textPainter.paint(canvas, Offset(width - 60, height - 60));
    //small triangle path

    Path smallTrianglePath = Path();
    smallTrianglePath.moveTo(40, 60);
    smallTrianglePath.lineTo(60, height * 0.2);
    smallTrianglePath.lineTo(20, height * 0.2);
    // path.lineTo(x, y)
    smallTrianglePath.close();
    canvas.drawPath(smallTrianglePath, paint);

    Path smallTrianglePath2 = Path();
    smallTrianglePath2.moveTo(40, 60);
    smallTrianglePath2.lineTo(60, height * 0.2);
    smallTrianglePath2.lineTo(20, height * 0.2);
    smallTrianglePath2.close();
    canvas.translate(width * 0.8, height * 0.65);
    canvas.rotate(0);
    canvas.drawPath(smallTrianglePath2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class Cross extends CustomPainter {
  final int numberValue;
  Cross({@required this.numberValue});
  @override
  void paint(Canvas canvas, Size size) {
    Color _color = Color(0XFF810F0F);
    Paint paint = Paint()..color = Colors.grey.withAlpha(100);
    final double width = size.width;
    final double height = size.height;
    Rect _cardBody = Rect.fromLTWH(0, 0, width, height);

    RRect cardBody = RRect.fromRectAndRadius(_cardBody, Radius.circular(10.0));
    canvas.drawRRect(cardBody, paint);
    paint.color = _color;

    // text Painter
    TextPainter textPainter = TextPainter(
        text: TextSpan(
            text: numberValue.toString(),
            style: TextStyle(fontSize: 40.0, color: _color)),
        textDirection: TextDirection.ltr);
    textPainter.layout(minWidth: 0, maxWidth: 50);

    textPainter.paint(canvas, Offset(width * 0.04, height * 0.025));
    textPainter.paint(canvas, Offset(width - 60, height - 60));
    Rect rect =
        Rect.fromLTWH(width * 0.34, height * 0.21, width * 0.35, height * 0.6);
    Rect rect2 =
        Rect.fromLTWH(width * 0.11, height * 0.37, width * 0.8, height * 0.28);

    canvas.drawRect(rect, paint);
    canvas.drawRect(rect2, paint);

    Rect rect3 =
        Rect.fromLTWH(width * 0.07, height * 0.13, width * 0.05, height * 0.1);
    Rect rect4 = Rect.fromLTWH(
        width * 0.035, height * 0.16, width * 0.12, height * 0.04);
    canvas.drawRect(rect3, paint);
    canvas.drawRect(rect4, paint);
    Rect rect5 =
        Rect.fromLTWH(width * 0.88, height * 0.76, width * 0.05, height * 0.1);
    Rect rect6 = Rect.fromLTWH(
        width * 0.845, height * 0.79, width * 0.12, height * 0.04);
    canvas.drawRect(rect5, paint);
    canvas.drawRect(rect6, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class Star extends CustomPainter {
  final int numberValue;
  Star({@required this.numberValue});
  @override
  void paint(Canvas canvas, Size size) {
    Color _color = Color(0XFF810F0F);
    Paint paint = Paint()..color = Colors.grey.withAlpha(100);
    final double width = size.width;
    final double height = size.height;
    Rect _cardBody = Rect.fromLTWH(0, 0, width, height);

    RRect cardBody = RRect.fromRectAndRadius(_cardBody, Radius.circular(10.0));
    canvas.drawRRect(cardBody, paint);
    paint.color = _color;

    // text Painter
    TextPainter textPainter = TextPainter(
        text: TextSpan(
            text: numberValue.toString(),
            style: TextStyle(fontSize: 40.0, color: _color)),
        textDirection: TextDirection.ltr);
    textPainter.layout(minWidth: 0, maxWidth: 50);

    textPainter.paint(canvas, Offset(width * 0.04, height * 0.025));
    textPainter.paint(canvas, Offset(width - 60, height - 60));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
