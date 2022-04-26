import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ProductCardView.dart';
import 'styles.dart';

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

  _onPageViewChange(int page) {
    setState(() { _pageIndex = page; });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: CupertinoColors.systemGroupedBackground,
        ),
        child: Column(
          children: [
            HeaderView(pageIndex: _pageIndex),
            SizedBox(
              height: 500,
              child: PageView(
                controller: _controller,
                children: [
                  ProductCardView(),
                  ProductCardView(),
                ],
                onPageChanged: _onPageViewChange,
              ),
            )
          ],
        ),
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
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Row(
              children: [
                Icon(CupertinoIcons.wifi, color: CupertinoColors.black),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text('WiFi', style: SFTextStyle.subheadline),
                ),
              ],
            ),
          ),
          Spacer(),
          Text('${pageIndex + 1}/2', style: SFTextStyle.subheadline.c(CupertinoColors.secondaryLabel)),
          Spacer(),
          SizedBox(
            width: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(CupertinoIcons.info_circle, color: CupertinoColors.black),
                ],
              )
          ),
        ],
      ),
    );
  }
}

