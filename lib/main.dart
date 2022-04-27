import 'package:easee_demo/view/MainMenuView.dart';
import 'package:flutter/cupertino.dart';

import 'model/Model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  // Root screen
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: MainMenuView(model: Model.preview),
      title: 'Easee',
    );
  }
}







