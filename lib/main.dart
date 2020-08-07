import 'package:animation/demo1.dart';
import 'package:animation/loader.dart';
import 'package:animation/paint1.dart';
import 'package:animation/staggered_animation.dart';
import 'package:animation/whirloop.dart';
import 'package:flutter/material.dart';
import 'package:animation/whot.dart';

import 'canvas_loading.dart';
import 'ludo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Ludo());
  }
}
