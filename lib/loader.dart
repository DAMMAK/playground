import 'package:flutter/material.dart';

class Loader extends StatefulWidget {
  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with TickerProviderStateMixin {
  AnimationController _animationController;
  AnimationController _animationController2;

  Animation _animation;
  // Animation Box 4
  Animation _animationBox1;
  Animation _animationBox2;
  Animation _animationBox3;
  Animation _animationBox4;
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3))
          ..repeat()
          ..addListener(() {
            setState(() {});
          });
    _animationController2 =
        AnimationController(vsync: this, duration: Duration(seconds: 3))
          ..forward()
          ..addListener(() {
            setState(() {});
          });

    _animation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _animationController2, curve: Curves.linear));
    _animationBox1 = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController, curve: Interval(0.0, 0.3)));
    _animationBox2 = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController, curve: Interval(0.3, 0.5)));
    _animationBox3 = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController, curve: Interval(0.5, 0.8)));
    _animationBox4 = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController, curve: Interval(0.8, 1.0)));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.black87,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[loadingLinear(), _loading4()],
      ),
    );
  }

  Widget loadingLinear() => Stack(
        children: <Widget>[
          Container(
            height: 50,
            width: 500,
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(50))),
          ),
          Positioned(
            top: 0,
            child: Container(
              height: 50,
              width: _animation.value * 500,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.8),
                      spreadRadius: 5,
                      blurRadius: 2,
                      offset: Offset(0, 0), // changes position of shadow
                    ),
                  ],
                  color: Colors.orange,
                  borderRadius: BorderRadius.all(Radius.circular(50))),
            ),
          ),
        ],
      );

  Widget _loading4() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            AnimatedOpacity(
              opacity: _animationBox1.value,
              duration: Duration(milliseconds: 500),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(50))),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            AnimatedOpacity(
              opacity: _animationBox2.value,
              duration: Duration(milliseconds: 200),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: <Widget>[
            AnimatedOpacity(
              opacity: _animationBox4.value,
              duration: Duration(milliseconds: 200),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(50))),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            AnimatedOpacity(
              opacity: _animationBox3.value,
              duration: Duration(milliseconds: 200),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
