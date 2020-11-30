import 'package:example/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Video Trimmer',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.pink,
        fontFamily: 'RobotoMono',
      ),
      home: HomePage(),
    );
  }
}
