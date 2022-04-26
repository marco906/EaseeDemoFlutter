import 'package:easee_demo/view/styles.dart';
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
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Sample Code'),
        backgroundColor: Colors.white,
        trailing: Icon(
          CupertinoIcons.chevron_down,
          color: Colors.black,
          size: SFFontSize.title2,
        ),
      ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Charging', style: SFTextStyle.title2.w(SFFontWeight.semibold)),
                ),
              Text('Garage 1', style: SFTextStyle.subheadline
                  .w(SFFontWeight.medium)
                  .c(CupertinoColors.tertiaryLabel)),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Image.asset('assets/blue.png', height: 200),
              ),
              const Icon(
                Icons.power_outlined,
                color: Colors.black,
                size: 30.0,
              ),
            ],
          ),
        ),
    );
  }
}

