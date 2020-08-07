import 'package:flutter/material.dart';

class CanvasLoading extends StatefulWidget {
  @override
  _CanvasLoadingState createState() => _CanvasLoadingState();
}

class _CanvasLoadingState extends State<CanvasLoading>
    with SingleTickerProviderStateMixin {
  AnimationController animationControlller;
  Animation animation;
  @override
  void initState() {
    super.initState();
    animationControlller =
        AnimationController(duration: Duration(seconds: 3), vsync: this);

    animation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: animationControlller, curve: Curves.linear));
    animationControlller.forward();
    animationControlller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: MediaQuery.of(context).size,
      painter: Wormhole(),
    );
  }
}

// class LoadCanvas extends CustomPainter {
//   Animation<double> animation;
//   LoadCanvas({this.animation});
//   @override
//   void paint(Canvas canvas, Size size) {
//     print(animation.value);
//     canvas.drawCircle(
//         Offset((size.width / 2) * animation.value, size.height / 2),
//         50,
//         Paint()..color = Colors.red);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     // TODO: implement shouldRepaint
//     return true;
//   }
// }

class Wormhole extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPaint(Paint()..color = Colors.black87);
  }

  void generateContent(Canvas canvas) {
    // for(int i =0; i <100000; i++){
    //  // canvas.drawCircle(c, 20, paint)
    // }
  }

//List<Color> colors =
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
