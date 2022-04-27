import 'package:easee_demo/view/WidgetExtensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/Model.dart';
import 'ProductCardView.dart';
import 'Styles.dart';

class ProductCardPageView extends StatefulWidget {
  @override
  _ProductCardPageViewState createState() => _ProductCardPageViewState();
}

class _ProductCardPageViewState extends State<ProductCardPageView> {
  final PageController _controller = PageController();
  int _pageIndex = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // updates the page index for display in HeaderView
  _onPageViewChange(int page) {
    setState(() { _pageIndex = page; });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: CupertinoColors.systemGroupedBackground,
        ),
        child: Column(
          //shrinkWrap: true,
          children: [
            HeaderView(pageIndex: _pageIndex),
            SizedBox(
              height: 500,
              child: PageView(
                controller: _controller,
                children: [
                  ProductCardView(robot: ChargeRobot(name: 'GARAGE 1', color: 'blue')),
                  ProductCardView(robot: ChargeRobot(name: 'GARAGE 2', color: 'white')),
                ],
                onPageChanged: _onPageViewChange,
              ),
            )
          ],
        ),
      );
  }
}

class HeaderView extends StatelessWidget {
  const HeaderView({
    Key? key,
    required this.pageIndex,
  }) : super(key: key);

  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Row(
            children: [
              Icon(CupertinoIcons.wifi, color: CupertinoColors.black),
              Text('WiFi', style: SFTextStyle.subheadline)
                  .padding(leading: 4),
            ],
          ).frame(width: 80),
          Spacer(),
          Text('${pageIndex + 1}/2', style: SFTextStyle.subheadline.c(CupertinoColors.secondaryLabel)),
          Spacer(),
          Icon(CupertinoIcons.info_circle, color: CupertinoColors.black)
              .alignment(alignment: Alignment.centerRight)
              .frame(width: 80),
        ],
      ).padding(all: 16);
  }
}
