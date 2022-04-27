import 'package:easee_demo/model/Model.dart';
import 'package:easee_demo/view/WidgetExtensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'FeatureView.dart';
import 'Styles.dart';

class ProductCardView extends StatelessWidget {
  const ProductCardView({ Key? key, required this.robot });

  final ChargeRobot robot;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('Charging', style: SFTextStyle.title2.w(SFFontWeight.semibold))
            .padding(bottom: 8),
          Text(robot.name, style: SFTextStyle.subheadline
              .w(SFFontWeight.medium)
              .c(CupertinoColors.tertiaryLabel)),
          Image.asset('assets/${robot.color}.png', height: 200)
            .padding(vertical: 8)
            .padding(top: 12),
          Row(
            children: const [
              FeatureView(
                  icon: CupertinoIcons.lock,
                  title: 'Cable',
                  subtitle: 'Locked'),
              Spacer(),
              FeatureView(
                  icon: CupertinoIcons.lock_open,
                  title: 'Access',
                  subtitle: 'Open',
                  leading: false),
            ],
          ).padding(all: 16),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: const ShapeDecoration(
                  shape: StadiumBorder(),
                  color: Colors.white,
                ),
                child: Row(
                  children: const [
                    FeatureView(icon: CupertinoIcons.bolt, title: '18A', subtitle: 'Available'),
                    Spacer(),
                    FeatureView(icon: CupertinoIcons.clock, title: 'Schedule', subtitle: 'Default', leading: false),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                decoration: const ShapeDecoration(
                  shape: CircleBorder(),
                  color: Colors.black,
                ),
                child: Icon(
                  CupertinoIcons.play_fill,
                  color: Colors.white,
                  size: SFFontSize.largeTitle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}