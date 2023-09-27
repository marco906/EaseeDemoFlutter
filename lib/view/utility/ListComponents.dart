// Section for list content
// ignore_for_file: file_names

import 'package:easee_demo/view/utility/styles.dart';
import 'package:easee_demo/view/utility/widgetExtensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  const Section({
    Key? key,
    this.headline = '',
    this.separatorInset = 16,
    required this.children,
  }) : super(key: key);
  final List<Widget> children;
  final String headline;
  final double separatorInset;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (headline.isEmpty == false)
          Text(headline, style: SFTextStyle.title3.w(SFFontWeight.semibold))
              .padding(all: 8),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: CupertinoColors.secondarySystemGroupedBackground,
          ),
          child: Column(
              children:
              // extract index and check if Divider should be displayed
              children.mapIndexed((index, child) => Column(
                children: [
                  child.padding(vertical: 4, horizontal: 16),
                  if (index != children.length - 1)
                    const Divider(height: 0).padding(leading: separatorInset)
                ],
              )
              ).toList()
          ),
        ),
      ],
    ).padding(all: 16);
  }
}

class LabelView extends StatelessWidget {
  const LabelView({
    Key? key,
    required this.title,
    required this.icon,
    this.isHighlighted = false,
  }) : super(key: key);
  final String title;
  final IconData icon;
  final bool isHighlighted;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: SFFontSize.title2, color: isHighlighted ? CupertinoColors.activeBlue : CupertinoColors.secondaryLabel),
        Text(title, style: SFTextStyle.body.c(isHighlighted ? CupertinoColors.activeBlue : Colors.black)).padding(leading: 12),
        const Spacer(),
        Icon(CupertinoIcons.chevron_forward, size: SFFontSize.body, color: CupertinoColors.tertiaryLabel),
      ],
    );
  }
}