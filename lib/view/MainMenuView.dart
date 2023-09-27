// ignore_for_file: file_names

import 'package:easee_demo/model/model.dart';
import 'package:easee_demo/view/siteView.dart';
import 'package:easee_demo/view/notificationsView.dart';
import 'package:easee_demo/view/utility/listComponents.dart';
import 'package:easee_demo/view/utility/navigation.dart';
import 'package:easee_demo/view/utility/styles.dart';
import 'package:easee_demo/view/utility/widgetExtensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Main menu or sidebar view
class MainMenuView extends StatelessWidget {
  const MainMenuView({
    Key? key,
    required this.model,
    this.sidebar = false,
  }) : super(key: key);
  final Model model;
  final bool sidebar;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          backgroundColor: CupertinoColors.systemGroupedBackground,
          border: null,
          middle: Text('easee'),
        ),
        backgroundColor: CupertinoColors.systemGroupedBackground,
        child: ListView(
          children: [
            const Section(
              children: [
                ProfileHeader(),
              ],
            ),
            Section(headline: 'Charging Sites', separatorInset: 50, children: [
              // dynamic list of charging sites
              for (var site in model.sites)
                if (sidebar) ...[
                  // Sidebar link
                  CupertinoButton(
                    padding: const EdgeInsets.all(0),
                    child: LabelView(title: site.name, icon: Icons.ev_station_outlined),
                    onPressed: () { model.setCurrentChargeSite(site); },
                  )
                ] else ...[
                  // Stack Nav link
                  NavigationLink(title: site.name, icon: Icons.ev_station_outlined, destination: SiteView(site: site))
                ]
            ]),
            const Section(
              headline: 'My easee',
              separatorInset: 50,
              children: [
                NavigationLink(title: 'Easee Keys', icon: Icons.key_outlined, destination: DummyLink(title: 'Keys')),
                NavigationLink(title: 'Notifications', icon: CupertinoIcons.bell, destination: NotificationsView()),
                NavigationLink(title: 'Settings', icon: CupertinoIcons.gear, destination: DummyLink(title: 'Settings')),
              ],
            ),

            const Section(
              separatorInset: 50,
              children: [
                NavigationLink(title: 'Support', icon: CupertinoIcons.question_circle, destination: DummyLink(title: 'Support')),
                NavigationLink(title: 'Log out', icon: CupertinoIcons.arrow_right_square, destination: DummyLink(title: 'Log Out')),
              ],
            ),

          ],
        )
    );
  }
}

// Subviews

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      child: Row(
        children: [
          Icon(CupertinoIcons.person_crop_circle, color: CupertinoColors.activeBlue, size: SFFontSize.largeTitle),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Marco', style: SFTextStyle.title2.w(SFFontWeight.semibold).c(Colors.black)),
                Text('Show Profile', style: SFTextStyle.subheadline.c(CupertinoColors.secondaryLabel)),
              ]
          ).padding(leading: 12)
        ],
      ),
      onPressed: () {
        Navigator.push(
          context,
          CupertinoPageRoute(builder: (context) => const DummyLink(title: 'Profile')),
        );
      },
    );
  }
}