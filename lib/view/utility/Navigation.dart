import 'package:flutter/cupertino.dart';
import 'ListComponents.dart';

class NavigationLink extends StatelessWidget {
  const NavigationLink({
    Key? key,
    required this.title,
    required this.icon,
    required this.destination,
  }) : super(key: key);
  final String title;
  final IconData icon;
  final Widget destination;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.all(0),
      child: LabelView(title: title, icon: icon),
      onPressed: () { Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) => destination
        ),
      );
      },
    );
  }
}

class DummyLink extends StatelessWidget {
  const DummyLink({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: CupertinoColors.white,
          middle: Text(title),
        ),
        child: Center(
          child: Text(title),
        )
    );
  }
}