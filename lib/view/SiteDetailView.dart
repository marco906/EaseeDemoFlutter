import 'package:easee_demo/view/WidgetExtensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'MainMenuView.dart';
import 'Styles.dart';

class SiteDetailView extends StatefulWidget {
  @override
  _SiteDetailViewState createState() => _SiteDetailViewState();
}

class _SiteDetailViewState extends State<SiteDetailView> {
  int? selectedPeriod = 1;

  @override
  Widget build(BuildContext context) {
      return Column(
        children: [
          CupertinoSlidingSegmentedControl<int>(
              groupValue: selectedPeriod,
              children: {
                0: buildSegment('Month'),
                1: buildSegment('Year'),
                2: buildSegment('Total'),
              },
              onValueChanged: (value) {
                setState(() { selectedPeriod = value; });
              }
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${consumption(selectedPeriod ?? 0)}', style: SFTextStyle.largeTitle.w(SFFontWeight.semibold)),
              Text('kWh', style: SFTextStyle.subheadline)
                .padding(all: 4),
            ],
          ).padding(vertical: 16).padding(top: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CircleButton(icon: CupertinoIcons.chevron_back),
              Text(periodLabel(selectedPeriod ?? 0), style: SFTextStyle.subheadline),
              const CircleButton(icon: Icons.power_input_rounded),
            ],
          ).padding(vertical: 16),
          const OptionButton(title: 'Power management').padding(vertical: 8),
          const OptionButton(title: 'Site settings'),
        ],
      ).padding(all: 16);
  }

  // Functions
  Text buildSegment(String title) => Text(title, style: SFTextStyle.subheadline.w(SFFontWeight.medium));

  int consumption(int period) {
    switch (period) {
      case 0:
        // Month
        return 230;
      case 1:
        // Year
        return 2049;
      default:
        return 6723;
    }
  }

  String periodLabel(int period) {
    switch (period) {
      case 0:
      // Month
        return 'April 2022';
      case 1:
      // Year
        return '2022';
      default:
        return '2020 - today';
    }
  }
}

// Subviews
class OptionButton extends StatelessWidget {
  const OptionButton({
    Key? key,
    required this.title,
    this.color = CupertinoColors.systemGroupedBackground,
  }) : super(key: key);

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: CupertinoButton(
        child: Row(
          children: [
            Text(title, style: SFTextStyle.body.c(Colors.black)),
            const Spacer(),
            Icon(CupertinoIcons.chevron_forward,
                color: CupertinoColors.secondaryLabel,
                size: SFFontSize.body)
          ],
        ),
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(builder: (context) => DummyLink(title: title)),
          );
        },
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