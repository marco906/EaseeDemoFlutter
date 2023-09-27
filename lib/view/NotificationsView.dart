// ignore_for_file: file_names

import 'package:easee_demo/view/utility/listComponents.dart';
import 'package:flutter/cupertino.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({Key? key}) : super(key: key);

  @override
  _NotificationsViewState createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  bool notfiChargeStart = true;
  bool notfiChargeEnd = true;
  bool notfiChargeInter = true;
  bool notfiAuthForgotten = true;
  bool notfiAuthFailed = true;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          backgroundColor: CupertinoColors.systemGroupedBackground,
          border: null,
          middle: Text('Notifications'),
        ),
        backgroundColor: CupertinoColors.systemGroupedBackground,
        child: ListView(children: [
          Section(
            headline: 'Charging',
            children: [
              Toggle(title: 'Charge started', isActive: notfiChargeStart, onChanged: (value) {
                  setState(() { notfiChargeStart = value;});
              }),
              Toggle(title: 'Charge ended', isActive: notfiChargeEnd, onChanged: (value) {
                setState(() { notfiChargeEnd = value;});
              }),
            ],
          ),

          Section(
            headline: 'Authentication',
            children: [
              Toggle(title: 'Auth forgotten', isActive: notfiAuthForgotten, onChanged: (value) {
                setState(() { notfiAuthForgotten = value;});
              }),
              Toggle(title: 'Auth failed', isActive: notfiAuthFailed, onChanged: (value) {
                setState(() { notfiAuthFailed = value;});
              }),
            ],
          ),
        ])
    );

  }
}

// Subviews
class Toggle extends StatelessWidget {
  const Toggle({
    Key? key,
    this.title = '',
    required this.isActive,
    required this.onChanged,
  }) : super(key: key);

  final String title;
  final bool isActive;
  final void Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        CupertinoSwitch(
          activeColor: CupertinoColors.activeBlue,
            value: isActive,
            onChanged:  (value) { onChanged(value); }),
      ],
    );
  }
}