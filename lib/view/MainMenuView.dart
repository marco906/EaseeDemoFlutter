import 'package:easee_demo/model/Model.dart';
import 'package:easee_demo/view/SiteView.dart';
import 'package:easee_demo/view/NotificationsView.dart';
import 'package:easee_demo/view/Styles.dart';
import 'package:easee_demo/view/WidgetExtensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

// Main menu or sidebar view
class MainMenuView extends StatelessWidget {
  const MainMenuView({
    Key? key,
    required this.model,
  }) : super(key: key);
  final Model model;

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

            Section(
              headline: 'Charging Sites',
              separatorInset: 50,
              children: [
                // dynamic list of charging sites
                for (var site in model.sites)
                  NavigationLink(title: site.name, icon: Icons.ev_station_outlined, destination: SiteView(site: site))
              ],

            ),
            Section(
              headline: 'My easee',
              separatorInset: 50,
              children: [
                const NavigationLink(title: 'Easee Keys', icon: Icons.key_outlined, destination: DummyLink(title: 'Keys')),
                NavigationLink(title: 'Notifications', icon: CupertinoIcons.bell, destination: NotificationsView()),
                const NavigationLink(title: 'Settings', icon: CupertinoIcons.gear, destination: DummyLink(title: 'Settings')),
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
// Section for list content
class Section extends StatelessWidget {
  const Section({
    Key? key,
    this.headline = '',
    this.separatorInset = 16,
    required this.children,
  }) : super(key: key);
  final List<Widget> children;
  final String headline;
  final double separatorInset;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (headline.isEmpty == false)
          Text(headline, style: SFTextStyle.title3.w(SFFontWeight.semibold))
            .padding(all: 8),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: CupertinoColors.secondarySystemGroupedBackground,
          ),
          child: Column(
            children:
              // extract index and check if Divider should be displayed
              children.mapIndexed((index, child) => Column(
                children: [
                  child.padding(vertical: 4, horizontal: 16),
                  if (index != children.length - 1)
                    const Divider(height: 0).padding(leading: separatorInset)
                ],
              )
              ).toList()
          ),
        ),
      ],
    ).padding(all: 16);
  }
}

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

class NavigationLink extends StatelessWidget {
  const NavigationLink({
    Key? key,
    required this.title,
    required this.icon,
    required this.destination,
  }) : super(key: key);
  final String title;
  final IconData icon;
  final Widget destination;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      child: LabelView(title: title, icon: icon),
      onPressed: () { Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) => destination
        ),
      );
      },
    );
  }
}

class LabelView extends StatelessWidget {
  const LabelView({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: SFFontSize.title2, color: CupertinoColors.secondaryLabel),
        Text(title, style: SFTextStyle.body.c(Colors.black)).padding(leading: 12),
        const Spacer(),
        Icon(CupertinoIcons.chevron_forward, size: SFFontSize.body, color: CupertinoColors.tertiaryLabel),
      ],
    );
  }
}

class DummyLink extends StatelessWidget {
  const DummyLink({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: CupertinoColors.white,
          middle: Text(title),
        ),
        child: Center(
          child: Text(title),
        )
    );
  }
}