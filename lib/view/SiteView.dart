import 'package:easee_demo/model/Model.dart';
import 'package:easee_demo/view/ProductCardPageView.dart';
import 'package:easee_demo/view/SiteDetailView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SiteView extends StatelessWidget {
  SiteView({
    Key? key,
    required this.site,
  }) : super(key: key);
  final ChargeSite site;
  final double minCardHeight = 0.5;
  final _controller = DraggableScrollableController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(site.name),
        backgroundColor: Colors.white,
        border: null,
        trailing: GestureDetector(
          child: const Icon(CupertinoIcons.chevron_up),
            // cant do this because controller not yet attached to DragSheet ?
            //.rotation(angle: (1.0 - minCardHeight - _controller.size) * 180),
          onTap: () { toggleCard(); }
        )
      ),
      child: Stack(
        children: [
          SiteDetailView(),
          DraggableScrollableSheet(
              initialChildSize: minCardHeight,
              minChildSize: minCardHeight,
              snap: true,
              controller: _controller,
              builder: (BuildContext context, ScrollController scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: CupertinoColors.systemGroupedBackground,
                  ),
                  child: ListView(
                    controller: scrollController,
                    children: [
                      ProductCardPageView(site: site,)
                    ],
                  ),
                );
              }
          ),
        ],
      ),
    );
  }

  void toggleCard() {
    _controller.animateTo(
        _controller.size == 1.0 ? minCardHeight : 1.0,
        duration: const Duration(milliseconds: 250),
        curve: Curves.elasticInOut);
  }
}