import 'package:easee_demo/view/MainMenuView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  // Root screen
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: HomeScreen(),
      title: 'Easee',
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainMenuView();
  }
}







