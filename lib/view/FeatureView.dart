import 'package:easee_demo/view/Styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeatureView extends StatelessWidget {
  const FeatureView({required this.icon, required this.title, required this.subtitle, this.leading = true });

  final IconData icon;
  final String title;
  final String subtitle;
  final bool leading;

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: leading ? TextDirection.ltr : TextDirection.rtl,
      children: [
        SizedBox(
          width: 25,
          child: Icon(
            icon,
            color: Colors.black,
            size: SFFontSize.title2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: leading ? CrossAxisAlignment.start : CrossAxisAlignment.end,
            children: [
              Text(title, style: SFTextStyle.subheadline),
              Text(subtitle, style: SFTextStyle.footnote.c(CupertinoColors.secondaryLabel)),
            ],
          ),
        ),
      ],
    );
  }
}