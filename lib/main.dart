import 'package:flutter/material.dart';
import 'home.dart';
import 'dart:async';
void main() => runApp(   MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'calculator',
      
      home:    SplashScreen(),
    );
  }
}
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => Calc()));
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: new Center(
        child: Image.asset('img/p.png',height: 150,width: 400,),
      ),
    );
  }
}
