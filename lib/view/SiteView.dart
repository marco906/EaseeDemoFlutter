import 'package:easee_demo/model/Model.dart';
import 'package:easee_demo/view/ProductCardPageView.dart';
import 'package:easee_demo/view/SiteDetailView.dart';
import 'package:easee_demo/view/utility/WidgetExtensions.dart';
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
        transitionBetweenRoutes: MediaQuery.of(context).size.width < 550,
        trailing: (MediaQuery.of(context).size.width < 800) ? GestureDetector(
          child: const Icon(CupertinoIcons.chevron_up, color: Colors.black),
          onTap: () { toggleCard(); }
        ) : null
      ),
      child: Row(
        children: [
          if (MediaQuery.of(context).size.width < 800) ...[
            // Phone
            Expanded(
              child: Stack(
                children: [
                  SiteDetailView(site: site),
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
            ),
          ] else ...[
            // Tablet
            Expanded(child: SiteDetailView(site: site)),
            buildProductPageView(null, 32)
            .frame(width: 400)
          ]

        ],
      ),
    );
  }

  // Product page view in ListView
  Container buildProductPageView(ScrollController? scrollController, double margin) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: margin, horizontal: margin/2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: CupertinoColors.systemGroupedBackground,
      ),
      child: ListView(
        controller: scrollController,
        children: [
          ProductCardPageView(
            site: site,
          )
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