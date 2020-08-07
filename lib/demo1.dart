import 'dart:math';

import 'package:flutter/material.dart';

class PaintDemo extends StatefulWidget {
  @override
  _PaintDemoState createState() => _PaintDemoState();
}

class _PaintDemoState extends State<PaintDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    // for (int i = 0; i < 2000000; i++) {
    //   setState(() {});
    // }
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3))
          ..repeat();
    _animation = Tween(begin: 1.0, end: 4.0).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.bounceInOut));
    _animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      child: CustomPaint(
        // size: MediaQuery.of(context).size,
        painter: DemoPainter(animation: _animation),
        child: Container(),
      ),
    );
  }
}

class DemoPainter extends CustomPainter {
  Animation animation;
  DemoPainter({this.animation});
  @override
  void paint(Canvas canvas, Size size) {
    print("Sisze $size");
    canvas.drawPaint(Paint()..color = Colors.black87);
    for (int i = 0; i < 1000; i++) {
      _drawScreen(canvas, size, 5.0, 5.0);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  void _drawScreen(Canvas canvas, Size size, double radius, double distance,
      {Color color}) {
    // print("Animation Value => ${animation.value}");
    Offset center = Offset(size.width / 2, size.height / 2);
    print(color.toString());
    // canvas.drawCircle(center, radius, Paint()..color = color);
    canvas.drawCircle(
        Offset(
            animation.value * (size.width * Random().nextDouble()) +
                (distance *
                    tan(Random().nextInt(1000)) *
                    cos(Random().nextInt(1000)) *
                    sin(Random().nextInt(1000))),
            animation.value * (size.height * Random().nextDouble()) +
                (distance * cos(Random().nextInt(1000)))),
        Random().nextDouble(),
        Paint()..color = colors[Random().nextInt(colors.length)]);
  }

  // var color = [
  //   Colors.blue,
  //   Colors.brown,
  //   Colors.deepOrange,
  //   Colors.indigo,
  //   Colors.pinkAccent,
  //   Colors.teal,
  //   Colors.yellowAccent,
  //   Colors.amberAccent,
  //   Colors.blueGrey,
  //   Colors.lime,
  //   Colors.cyan
  // ];

  var colors = [
    Colors.white,
    Colors.white10,
    Colors.white12,
    Colors.white24,
    Colors.white30,
    Colors.white38,
    Colors.white54,
    Colors.white60,
    Colors.white70,
    Colors.lime,
    Colors.cyan
  ];
}

// class PaintDemo extends StatefulWidget {
//   @override
//   _PaintDemoState createState() => _PaintDemoState();
// }

// class _PaintDemoState extends State<PaintDemo>
//     with SingleTickerProviderStateMixin {
//   AnimationController _animationController;
//   Animation animationBox1;
//   Animation animationBox2;
//   Animation animationBox3;
//   Animation animationBox4;

//   @override
//   void initState() {
//     super.initState();
//     _animationController =
//         AnimationController(vsync: this, duration: Duration(seconds: 2))
//           ..repeat();

//     animationBox1 = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
//         parent: _animationController, curve: Interval(0.1, 0.3)));
//     animationBox2 = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
//         parent: _animationController, curve: Interval(0.3, 0.5)));
//     animationBox3 = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
//         parent: _animationController, curve: Interval(0.5, 0.8)));

//     animationBox4 = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
//         parent: _animationController, curve: Interval(0.8, 1.0)));

//     _animationController.addListener(() {
//       setState(() {});
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     print(animationBox1.value);
//     return Container(
//       color: Colors.black87,
//       child: Center(
//         child: Stack(
//           children: <Widget>[
//             AnimatedOpacity(
//               opacity: animationBox4.value,
//               duration: Duration(seconds: 1),
//               child: Container(
//                 height: 250,
//                 width: 250,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Colors.blue.shade100,
//                 ),
//               ),
//             ),
//             Positioned(
//               left: 24,
//               top: 24,
//               child: AnimatedOpacity(
//                 opacity: animationBox3.value,
//                 duration: Duration(seconds: 1),
//                 child: Container(
//                   height: 200,
//                   width: 200,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Colors.blue.shade200,
//                   ),
//                 ),
//               ),
//             ),
//             Positioned(
//               left: 50,
//               top: 50,
//               child: AnimatedOpacity(
//                 opacity: animationBox2.value,
//                 duration: Duration(seconds: 1),
//                 child: Container(
//                   height: 150,
//                   width: 150,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Colors.blue.shade400,
//                   ),
//                 ),
//               ),
//             ),
//             Positioned(
//               left: 75,
//               top: 75,
//               child: AnimatedOpacity(
//                 opacity: animationBox1.value,
//                 duration: Duration(seconds: 2),
//                 child: Container(
//                   height: 100,
//                   width: 100,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Colors.blue.shade600,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
