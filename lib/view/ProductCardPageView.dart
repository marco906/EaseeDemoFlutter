import 'package:easee_demo/view/utility/WidgetExtensions.dart';
import 'package:flutter/cupertino.dart';
import '../model/Model.dart';
import 'ProductCardView.dart';
import 'SiteDetailView.dart';
import 'utility/Styles.dart';

class ProductCardPageView extends StatefulWidget {
  const ProductCardPageView({Key? key, required this.site}) : super(key: key);
  final ChargeSite site;

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
    return Column(
          children: [
            HeaderView(pageIndex: _pageIndex, pageCount: widget.site.chargers.length),
            SizedBox(
              height: 500,
              child: PageView(
                controller: _controller,
                children: [
                  // dynamically create pages for chargers in site
                  for(var robot in widget.site.chargers ) ProductCardView(robot: robot)
                ],
                onPageChanged: _onPageViewChange,
              ),
            ),
            const OptionButton(title: 'Power options', color: CupertinoColors.white)
                .padding(horizontal: 16)
                .padding(vertical:4),
            const OptionButton(title: 'Charger settings', color: CupertinoColors.white)
                .padding(horizontal: 16)
                .padding(vertical:4),
          ],
        );
  }
}

class HeaderView extends StatelessWidget {
  const HeaderView({
    Key? key,
    required this.pageIndex, required this.pageCount,
  }) : super(key: key);

  final int pageIndex;
  final int pageCount;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Row(
            children: [
              const Icon(CupertinoIcons.wifi, color: CupertinoColors.black),
              Text('WiFi', style: SFTextStyle.subheadline)
                  .padding(leading: 4),
            ],
          ).frame(width: 80),
          const Spacer(),
          Text('${pageIndex + 1}/$pageCount', style: SFTextStyle.subheadline.c(CupertinoColors.secondaryLabel)),
          const Spacer(),
          const Icon(CupertinoIcons.info_circle, color: CupertinoColors.black)
              .alignment(alignment: Alignment.centerRight)
              .frame(width: 80),
        ],
      ).padding(all: 16);
  }
}
