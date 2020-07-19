import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yellow_billy_bot/screens/bot_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }

}

class SplashScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SplashState();
    throw UnimplementedError();
  }


}

class _SplashState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
     color: Colors.white,
      child: Center(child: CircularProgressIndicator()),
    );
    throw UnimplementedError();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 2),
            () => handlePage()
    );
  }
  void handlePage(){
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => BotScreen()),
            (Route<dynamic> route) => false);
  }
}

