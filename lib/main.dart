import 'package:easee_demo/model/model.dart';
import 'package:easee_demo/view/mainMenuView.dart';
import 'package:easee_demo/view/siteView.dart';
import 'package:easee_demo/view/utility/widgetExtensions.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  // Root screen
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: HomeView(),
      title: 'Easee',
    );
  }
}

class HomeView extends StatelessWidget {
  HomeView({ Key? key}) : super(key: key);

  final model = Model.preview;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (MediaQuery.of(context).size.width < 550) ...[
          // phone stack view
          Expanded(child: MainMenuView(model: model)),
        ] else ...[
          // tablet splitview
          MainMenuView(model: model, sidebar: true).frame(width: 300),
          AnimatedBuilder(
            animation: model,
            builder: (context, widget) {
              return Expanded(child: SiteView(site: model.currentSite ?? ChargeSite.preview));
            },
          )
        ]
      ],
    );
  }
}







