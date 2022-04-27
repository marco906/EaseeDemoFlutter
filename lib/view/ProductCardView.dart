import 'package:easee_demo/model/Model.dart';
import 'package:easee_demo/view/WidgetExtensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'FeatureView.dart';
import 'Styles.dart';

class ProductCardView extends StatelessWidget {
  const ProductCardView({ Key? key, required this.robot }): super(key: key);

  final ChargeRobot robot;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedBuilder(
            animation: robot,
            builder: (context, widget) {
              return Text(robot.isCharging ? 'Charging' : 'Paused', style: SFTextStyle.title2.w(SFFontWeight.semibold));
            },
          ).padding(bottom: 8),

          Text(robot.name, style: SFTextStyle.subheadline
              .w(SFFontWeight.medium)
              .c(CupertinoColors.tertiaryLabel)),

          // Robot image
          Image.asset('assets/${robot.color}.png', height: 200)
            .padding(vertical: 8)
            .padding(top: 12),

          // Lock buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildCableLockButton(),
              buildAccessLockButton(),
            ],
          ).padding(all: 16),

          // Charge button row
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
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

              // Charge button
              GestureDetector(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const ShapeDecoration(
                    shape: CircleBorder(),
                    color: Colors.black,
                  ),
                  child:
                  AnimatedBuilder(
                    animation: robot,
                    builder: (context, widget) {
                      return buildChargeIcon(robot.isCharging);
                    },
                  ),
                ),
                onTap: () { robot.setCharging(!robot.isCharging); },
              ),
            ],
          ),
        ],
      ),
    );
  }

  GestureDetector buildCableLockButton() {
    return GestureDetector(
      child: AnimatedBuilder(
          animation: robot,
          builder: (context, widget) {
            return FeatureView(
                icon: robot.isCableLocked ? CupertinoIcons.lock : CupertinoIcons.lock_open,
                title: 'Cable',
                subtitle: robot.isCableLocked ? 'Locked' : 'Unlocked');
          }),
      onTap: () {
        robot.setCableLocked(!robot.isCableLocked);
      },
    );
  }

  GestureDetector buildAccessLockButton() {
    return GestureDetector(
      child: AnimatedBuilder(
          animation: robot,
          builder: (context, widget) {
            return FeatureView(
                icon: robot.isAccessLocked ? CupertinoIcons.lock : CupertinoIcons.lock_open,
                title: 'Access',
                subtitle: robot.isAccessLocked? 'Locked' : 'Unlocked', leading: false);
          }),
      onTap: () {
        robot.setAccessLocked(!robot.isAccessLocked);
      },
    );
  }

  Icon buildChargeIcon(bool isCharging) {
    return Icon(
                  isCharging ? CupertinoIcons.pause : CupertinoIcons.play_fill,
                  color: Colors.white,
                  size: SFFontSize.largeTitle,
                );
  }
}