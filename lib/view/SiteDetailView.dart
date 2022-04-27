import 'package:easee_demo/view/WidgetExtensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Styles.dart';

class SiteDetailView extends StatelessWidget {
  const SiteDetailView ({ Key? key }): super(key: key);
  final int consumption = 2049;

  @override
  Widget build(BuildContext context) {
      return Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('$consumption', style: SFTextStyle.largeTitle.w(SFFontWeight.semibold)),
              Text('kWh', style: SFTextStyle.subheadline)
                .padding(all: 4),
            ],
          ).padding(vertical: 16),
          Row(
            children: [
              CircleButton(icon: CupertinoIcons.chevron_back),
              Spacer(),
              Text('2021', style: SFTextStyle.subheadline),
              Spacer(),
              CircleButton(icon: Icons.power_input_rounded),
            ],
          ).padding(vertical: 16),
          OptionButton(title: 'Power management').padding(vertical: 8),
          OptionButton(title: 'Site settings'),
        ],
      ).padding(all: 16);
  }
}

// Subviews
class OptionButton extends StatelessWidget {
  const OptionButton({
    Key? key,
    required this.title
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: CupertinoColors.systemGroupedBackground,
      child: Row(
        children: [
          Text(title, style: SFTextStyle.body),
          Spacer(),
          Icon(CupertinoIcons.chevron_forward,
            color: CupertinoColors.secondaryLabel,
          size: SFFontSize.body)
        ],
      ),
    );
  }
}

class CircleButton extends StatelessWidget {
  const CircleButton({
    Key? key,
    required this.icon
  }) : super(key: key);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const ShapeDecoration(
        shape: CircleBorder(),
        color: CupertinoColors.systemGroupedBackground,
      ),
      child: Icon(
        icon,
        color: Colors.black,
        size: SFFontSize.title3,
      ),
    );
  }
}