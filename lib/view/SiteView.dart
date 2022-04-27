import 'package:easee_demo/view/ProductCardPageView.dart';
import 'package:easee_demo/view/SiteDetailView.dart';
import 'package:easee_demo/view/Styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SiteView extends StatelessWidget {
  const SiteView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Home'),
        backgroundColor: Colors.white,
        border: null,
        trailing: Icon(
          CupertinoIcons.chevron_down,
          color: Colors.black,
          size: SFFontSize.title2,
        ),
      ),
      child: Stack(
        children: [
          SiteDetailView(),
          DraggableScrollableSheet(
              initialChildSize: 0.5,
              minChildSize: 0.5,
              snap: true,
              builder: (BuildContext context, ScrollController scrollController) {
                return ListView(
                  controller: scrollController,
                  children: [
                    ProductCardPageView()
                  ],
                );
              }
          ),
        ],
      ),
    );
  }
}