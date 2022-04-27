import 'package:easee_demo/view/SiteView.dart';
import 'package:easee_demo/view/Styles.dart';
import 'package:easee_demo/view/WidgetExtensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Main menu or sidebar view
class MainMenuView extends StatelessWidget {
  const MainMenuView({
    Key? key,
  }) : super(key: key);

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
              children: [
                NavigationLink(title: 'Home', icon: Icons.ev_station_outlined, child: SiteView()),
                Divider(height: 0,).padding(leading: 50),
                NavigationLink(title: 'Cabin', icon: Icons.ev_station_outlined, child: SiteView()),
              ],
            ),
            Section(
              headline: 'My easee',
              children: [
                NavigationLink(title: 'Easee Keys', icon: Icons.key_outlined, child: DummyLink(title: 'Keys')),
                Divider(height: 0,).padding(leading: 50),
                NavigationLink(title: 'Notifications', icon: CupertinoIcons.bell, child: DummyLink(title: 'Notifications')),
                Divider(height: 0,).padding(leading: 50),
                NavigationLink(title: 'Settings', icon: CupertinoIcons.gear, child: DummyLink(title: 'Settings')),
              ],
            ),
            Section(
              children: [
                NavigationLink(title: 'Support', icon: CupertinoIcons.question_circle, child: DummyLink(title: 'Support')),
                Divider(height: 0,).padding(leading: 50),
                NavigationLink(title: 'Log out', icon: CupertinoIcons.arrow_right_square, child: DummyLink(title: 'Log Out')),
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
    this.children = const <Widget>[],
  }) : super(key: key);
  final List<Widget> children;
  final String headline;

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
            children: children,
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
      child: Row(
        children: [
          Icon(CupertinoIcons.person_crop_circle_fill, color: CupertinoColors.activeBlue, size: SFFontSize.largeTitle),
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
    required this.child,
  }) : super(key: key);
  final String title;
  final IconData icon;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: LabelView(title: title, icon: icon),
      onPressed: () { Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) => child
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