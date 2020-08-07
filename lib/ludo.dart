import 'package:flutter/material.dart';

class Ludo extends StatelessWidget {
  double height;
  double width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        color: Colors.orange,
        child: Row(
          children: [
            CustomPaint(
              size: Size.square(height),
              painter: LudoBoard(),
            ),
          ],
        ),
      ),
    );
  }
}

class LudoBoard extends CustomPainter {
  double left = 0;
  double top = 0;
  double height;
  double width;

  double unit;
  double stroke;
  double unitStroke;

  Color _red = Colors.red;
  Color _green = Colors.green;
  Color _blue = Colors.blue;
  Color _yellow = Colors.yellow;

  @override
  void paint(Canvas canvas, Size size) {
    double minsize;
    stroke = 4.0;
    double strokeSize = stroke * 14;
    //minsize = size.width;
    minsize = (size.height < size.width)
        ? size.height
        : size.width; // ensuring drawing is square

    unit =
        (minsize - strokeSize) / 15; // there will be squares across x & y axis
    unitStroke = unit + stroke; // 1 unit, 1 stroke

    height = minsize;
    width = minsize;
    // height = size.height;
    // width = size.width;

    Paint paint = Paint()
      ..color = Colors.white
      ..strokeWidth = stroke;
    Rect rect = Rect.fromLTWH(0, 0, width, height);
    canvas.drawRect(rect, paint);

    //Player Boxes
    double boxOffset = unitStroke * 9;
    //double boxOffset = (unit * 9) + (stroke * 9); // same value
    //double boxOffset = minsize - ((unit * 6) + (stroke * 5)); // same value (tested)

    paint.color = _red;
    _drawPlayerBox(top: 0, left: 0, paint: paint, canvas: canvas);
    paint.color = _green;
    _drawPlayerBox(top: 0, left: boxOffset, paint: paint, canvas: canvas);
    paint.color = _yellow;
    _drawPlayerBox(
        top: boxOffset, left: boxOffset, paint: paint, canvas: canvas);
    paint.color = _blue;
    _drawPlayerBox(top: boxOffset, left: 0, paint: paint, canvas: canvas);

    // Draw inner white Box
    paint.color = Colors.white;
    Rect insideRect = _drawInsideRect(left: unitStroke, top: unitStroke);
    canvas.drawRect(insideRect, paint); // red
    Rect insideRect2 = _drawInsideRect(left: unitStroke * 10, top: unitStroke);
    canvas.drawRect(insideRect2, paint); // green
    Rect insideRect3 =
        _drawInsideRect(left: unitStroke * 10, top: unitStroke * 10);
    canvas.drawRect(insideRect3, paint); // yellow
    Rect insideRect4 = _drawInsideRect(left: unitStroke, top: unitStroke * 10);
    canvas.drawRect(insideRect4, paint); // blue

    paint.color = _red;
    _drawRedItem(canvas, paint);
    var redBox =
        Rect.fromLTWH(unitStroke - 2, unitStroke * 7 - 2, 5 * unitStroke, unit);
    canvas.drawRect(redBox, paint);
    var redBoxInside =
        Rect.fromLTWH(unitStroke - 2, unitStroke * 6 - 2, unit, unit);
    canvas.drawRect(redBoxInside, paint);

    paint.color = _green;
    _drawGreenItem(canvas, paint);
    var greenBox =
        Rect.fromLTWH(unitStroke * 7 - 2, unitStroke - 2, unit, 5 * unitStroke);
    canvas.drawRect(greenBox, paint);

    var greenBoxInside =
        Rect.fromLTWH(unitStroke * 8 - 2, unitStroke - 2, unit, unit);
    canvas.drawRect(greenBoxInside, paint);

    paint.color = _yellow;
    _drawYellowItem(canvas, paint);
    // Home Color Painting
    var yellowBox = Rect.fromLTWH(
        unitStroke * 9 - 2, unitStroke * 7 - 2, 5 * unitStroke, unit);
    canvas.drawRect(yellowBox, paint);

    var yellowBoxInside =
        Rect.fromLTWH(unitStroke * 13 - 2, unitStroke * 8 - 2, unit, unit);
    canvas.drawRect(yellowBoxInside, paint);

    paint.color = _blue;
    _drawBlueItem(canvas, paint);
    // Blue Color Painting
    var blueBox = Rect.fromLTWH(
        unitStroke * 7 - 2, unitStroke * 9 - 2, unit, 5 * unitStroke);
    canvas.drawRect(blueBox, paint);
    var blueBoxInside =
        Rect.fromLTWH(unitStroke * 6 - 2, unitStroke * 13 - 2, unit, unit);
    canvas.drawRect(blueBoxInside, paint);

//Horizontal line End
    paint.color = Colors.black;
//     canvas.drawLine(Offset(0, 0), Offset(width, 0), paint);
//     canvas.drawLine(Offset(0, 0), Offset(0, minsize), paint);
//     canvas.drawLine(Offset(minsize - 2, 0), Offset(minsize - 2, minsize - 2), paint);
//     canvas.drawLine(Offset(0, minsize - 2), Offset(minsize, minsize - 2), paint);

    canvas.drawLine(Offset(0, 6 * unitStroke - stroke),
        Offset(width, 6 * unitStroke - stroke), paint);
    canvas.drawLine(Offset(0, 7 * unitStroke - stroke),
        Offset(width, 7 * unitStroke - stroke), paint);
    canvas.drawLine(Offset(0, 8 * unitStroke - stroke),
        Offset(width, 8 * unitStroke - stroke), paint);
    canvas.drawLine(Offset(0, 9 * unitStroke - stroke),
        Offset(width, 9 * unitStroke - stroke), paint);

//Vertical Line End
    canvas.drawLine(Offset(6 * unitStroke - stroke, 0),
        Offset(6 * unitStroke - stroke, height), paint);
    canvas.drawLine(Offset(7 * unitStroke - stroke, 0),
        Offset(7 * unitStroke - stroke, height), paint);
    canvas.drawLine(Offset(8 * unitStroke - stroke, 0),
        Offset(8 * unitStroke - stroke, height), paint);
    canvas.drawLine(Offset(9 * unitStroke - stroke, 0),
        Offset(9 * unitStroke - stroke, height), paint);

    //Draw Red Intersection
    canvas.drawLine(Offset(unit, 6 * unitStroke - stroke),
        Offset(unit, 9 * unitStroke - stroke), paint);
    canvas.drawLine(Offset(unit + unitStroke, 6 * unitStroke - stroke),
        Offset(unit + unitStroke, 9 * unitStroke - stroke), paint);
    canvas.drawLine(Offset(unit + (2 * unitStroke), 6 * unitStroke - stroke),
        Offset(unit + (2 * unitStroke), 9 * unitStroke - stroke), paint);
    canvas.drawLine(Offset(unit + (3 * unitStroke), 6 * unitStroke - stroke),
        Offset(unit + (3 * unitStroke), 9 * unitStroke - stroke), paint);
    canvas.drawLine(Offset(unit + (4 * unitStroke), 6 * unitStroke - stroke),
        Offset(unit + (4 * unitStroke), 9 * unitStroke - stroke), paint);

    //Draw Blue Intersection
    canvas.drawLine(Offset(6 * unitStroke - stroke, unit + (9 * unitStroke)),
        Offset(9 * unitStroke - stroke, unit + (9 * unitStroke)), paint);
    canvas.drawLine(Offset(6 * unitStroke - stroke, unit + (10 * unitStroke)),
        Offset(9 * unitStroke - stroke, unit + (10 * unitStroke)), paint);
    canvas.drawLine(Offset(6 * unitStroke - stroke, unit + (11 * unitStroke)),
        Offset(9 * unitStroke - stroke, unit + (11 * unitStroke)), paint);
    canvas.drawLine(Offset(6 * unitStroke - stroke, unit + (12 * unitStroke)),
        Offset(9 * unitStroke - stroke, unit + (12 * unitStroke)), paint);
    canvas.drawLine(Offset(6 * unitStroke - stroke, unit + (13 * unitStroke)),
        Offset(9 * unitStroke - stroke, unit + (13 * unitStroke)), paint);

//Draw Yellow Intersection

    canvas.drawLine(Offset(unit + (9 * unitStroke), 6 * unitStroke - stroke),
        Offset(unit + (9 * unitStroke), 9 * unitStroke - stroke), paint);
    canvas.drawLine(Offset(unit + (10 * unitStroke), 6 * unitStroke - stroke),
        Offset(unit + (10 * unitStroke), 9 * unitStroke - stroke), paint);
    canvas.drawLine(Offset(unit + (11 * unitStroke), 6 * unitStroke - stroke),
        Offset(unit + (11 * unitStroke), 9 * unitStroke - stroke), paint);
    canvas.drawLine(Offset(unit + (12 * unitStroke), 6 * unitStroke - stroke),
        Offset(unit + (12 * unitStroke), 9 * unitStroke - stroke), paint);
    canvas.drawLine(Offset(unit + (13 * unitStroke), 6 * unitStroke - stroke),
        Offset(unit + (13 * unitStroke), 9 * unitStroke - stroke), paint);

    // Draw Green Intersection
    canvas.drawLine(Offset(6 * unitStroke - stroke, unit),
        Offset(9 * unitStroke - stroke, unit), paint);
    canvas.drawLine(Offset(6 * unitStroke - stroke, unit + unitStroke),
        Offset(9 * unitStroke - stroke, unit + unitStroke), paint);
    canvas.drawLine(Offset(6 * unitStroke - stroke, unit + (2 * unitStroke)),
        Offset(9 * unitStroke - stroke, unit + (2 * unitStroke)), paint);
    canvas.drawLine(Offset(6 * unitStroke - stroke, unit + (3 * unitStroke)),
        Offset(9 * unitStroke - stroke, unit + (3 * unitStroke)), paint);
    canvas.drawLine(Offset(6 * unitStroke - stroke, unit + (4 * unitStroke)),
        Offset(9 * unitStroke - stroke, unit + (4 * unitStroke)), paint);

    canvas.translate(width * 0.32, height * 0.44);
    paint.color = _blue;
    _drawTriangle(canvas, paint);
  }

  Rect _drawInsideRect({left, top}) => Rect.fromLTWH(
      left, top, (unit * 4) + (stroke * 3), (unit * 4) + (stroke * 3));

  void _drawInCircle({Canvas canvas, Paint paint, Offset offset}) {
    canvas.drawCircle(offset, unit / 1.5, paint);
  }

  void _drawRedItem(Canvas canvas, Paint paint) {
    _drawInCircle(
        canvas: canvas,
        paint: paint,
        offset: Offset(unitStroke * 2, unitStroke * 2));
    _drawInCircle(
        canvas: canvas,
        paint: paint,
        offset: Offset(unitStroke * 4, unitStroke * 2));
    _drawInCircle(
        canvas: canvas,
        paint: paint,
        offset: Offset(unitStroke * 2, unitStroke * 4));
    _drawInCircle(
        canvas: canvas,
        paint: paint,
        offset: Offset(unitStroke * 4, unitStroke * 4));
  }

  void _drawGreenItem(Canvas canvas, Paint paint) {
    _drawInCircle(
        canvas: canvas,
        paint: paint,
        offset: Offset(unitStroke * 11, unitStroke * 2));
    _drawInCircle(
        canvas: canvas,
        paint: paint,
        offset: Offset(unitStroke * 13, unitStroke * 2));
    _drawInCircle(
        canvas: canvas,
        paint: paint,
        offset: Offset(unitStroke * 11, unitStroke * 4));
    _drawInCircle(
        canvas: canvas,
        paint: paint,
        offset: Offset(unitStroke * 13, unitStroke * 4));
  }

  void _drawYellowItem(Canvas canvas, Paint paint) {
    _drawInCircle(
        canvas: canvas,
        paint: paint,
        offset: Offset(unitStroke * 11, unitStroke * 11));
    _drawInCircle(
        canvas: canvas,
        paint: paint,
        offset: Offset(unitStroke * 13, unitStroke * 11));
    _drawInCircle(
        canvas: canvas,
        paint: paint,
        offset: Offset(unitStroke * 11, unitStroke * 13));
    _drawInCircle(
        canvas: canvas,
        paint: paint,
        offset: Offset(unitStroke * 13, unitStroke * 13));
  }

  void _drawBlueItem(Canvas canvas, Paint paint) {
    _drawInCircle(
        canvas: canvas,
        paint: paint,
        offset: Offset(unitStroke * 2, unitStroke * 11));
    _drawInCircle(
        canvas: canvas,
        paint: paint,
        offset: Offset(unitStroke * 4, unitStroke * 11));
    _drawInCircle(
        canvas: canvas,
        paint: paint,
        offset: Offset(unitStroke * 2, unitStroke * 13));
    _drawInCircle(
        canvas: canvas,
        paint: paint,
        offset: Offset(unitStroke * 4, unitStroke * 13));
  }

  void _drawTriangle(
    Canvas canvas,
    Paint paint,
  ) {
    //var triagHeight = height * 0.1;
    Path path = Path();

    path.moveTo(width, 0);
    path.lineTo(width * 0.05, height * 0.3);
    path.lineTo(height * 0.3, height * 0.09);
    path.close();
    // path.lineTo(x, y)
    path.close();
    //canvas.drawPath(path, paint);
  }

  void _drawPlayerBox({Canvas canvas, Paint paint, double left, double top}) {
    double side = (unit * 6) + (stroke * 5);
    Rect _rect = Rect.fromLTWH(left, top, side, side);
    canvas.drawRect(_rect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
