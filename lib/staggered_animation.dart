import 'package:flutter/material.dart';

class StaggeredAnimation extends StatefulWidget {
  StaggeredAnimation({Key key}) : super(key: key);

  @override
  _StaggeredAnimationState createState() => _StaggeredAnimationState();
}

class _StaggeredAnimationState extends State<StaggeredAnimation>
    with SingleTickerProviderStateMixin {
  double height;
  double width;
  AnimationController _controller;
  Animation<double> _nameAnimation;
  Animation<double> _content1;
  Animation<double> _content2;
  Animation<double> _dateContent;
  Animation<double> _item1;
  Animation<double> _item2;
  Animation<double> _item3;
  Animation<double> _pic;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    _dateContent = Tween<double>(begin: -50.0, end: 0.0).animate(
        CurvedAnimation(parent: _controller, curve: Interval(0.0, 0.1)));
    _nameAnimation = Tween<double>(begin: 0.0, end: 24.0).animate(
        CurvedAnimation(
            parent: _controller,
            curve: Interval(0.1, 0.2, curve: Curves.easeIn)));
    _pic = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: Interval(0.2, 0.3)));
    _item1 = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: Interval(0.3, 0.4)));
    _item2 = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: Interval(0.4, 0.5)));
    _item3 = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: Interval(0.5, 0.6)));

    _content1 = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: Interval(0.6, 0.8)));
    _content2 = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: Interval(0.8, 1.0)));
    _controller.forward();
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    var styleNum =
        TextStyle(fontWeight: FontWeight.bold, fontSize: height * 0.03);
    var styleLabel = TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.w600,
        fontSize: height * 0.013);
    var bodypadding = 0.07;
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * bodypadding),
        child: Column(
          children: <Widget>[
            SizedBox(height: height * 0.07),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Transform.translate(
                      offset: Offset(_dateContent.value, 0.0),
                      child: Text("April 18th",
                          style: TextStyle(
                              fontSize: height * 0.015,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold)),
                    ),
                    Text(
                      "Damola Adekoya",
                      style: TextStyle(
                          fontSize: _nameAnimation.value,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Transform.rotate(
                  angle: _pic.value * 12.7,
                  child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          child: Image.asset('assets/images/profile.jpg'))),
                )
              ],
            ),
            SizedBox(height: height * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                AnimatedOpacity(
                  opacity: _item1.value,
                  duration: Duration(seconds: 1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("95", style: styleNum),
                      Text("Approve", style: styleLabel),
                    ],
                  ),
                ),
                AnimatedOpacity(
                  duration: Duration(seconds: 1),
                  opacity: _item2.value,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("36", style: styleNum),
                      Text("Approved", style: styleLabel),
                    ],
                  ),
                ),
                AnimatedOpacity(
                  opacity: _item3.value,
                  duration: Duration(seconds: 1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("08", style: styleNum),
                      Text("Project", style: styleLabel),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: height * 0.07),
            Transform.scale(
              scale: _content1.value,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _cardItem(color: Color(0XFF7480FF)),
                  _cardItem(color: Color(0XFFFF9E79))
                ],
              ),
            ),
            SizedBox(height: height * 0.04),
            AnimatedOpacity(
              opacity: _content2.value,
              duration: Duration(milliseconds: 500),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _cardItem(color: Color(0XFF64D1B5)),
                  _cardItem(color: Color(0XFFFF9B8C))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _cardItem({color}) => ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(height * 0.02)),
        child: Container(
          height: height * 0.25,
          color: color,
          width: (width / 2) - width * 0.09,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        shape: BoxShape.circle),
                    child: Icon(Icons.message, color: Colors.white)),
                SizedBox(height: height * 0.03),
                Text("Personal Reminder", style: TextStyle(color: Colors.white))
              ],
            ),
          ),
          // child: Column(
          //   crossAxisAlignment:  ssCrossAxisAlignment.center,
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[Icon(Icons.access_time)],
          // ),
        ),
      );
}
