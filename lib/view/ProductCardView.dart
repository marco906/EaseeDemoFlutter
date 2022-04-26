import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'FeatureView.dart';
import 'styles.dart';

class ProductCardView extends StatelessWidget {
  const ProductCardView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: Text('Charging', style: SFTextStyle.title2.w(SFFontWeight.semibold)),
          ),
          Text('GARAGE 1', style: SFTextStyle.subheadline
              .w(SFFontWeight.medium)
              .c(CupertinoColors.tertiaryLabel)),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 24, 0, 8),
            child: Image.asset('assets/blue.png', height: 200),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: const [
                FeatureView(icon: CupertinoIcons.lock, title: 'Cable', subtitle: 'Locked'),
                Spacer(),
                FeatureView(icon: CupertinoIcons.lock_open, title: 'Access', subtitle: 'Open', leading: false),
              ],
            ),
          ),
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
                    FeatureView(icon: CupertinoIcons.bolt, title: '18A', subtitle: 'Avialable'),
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