import 'package:btb/core/theme/styles.dart';
import 'package:btb/view/home/home.dart';
import 'package:btb/view/trades_page.dart';
import 'package:btb/view/wallet_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class AppScaffold extends StatefulWidget {
  const AppScaffold({Key? key}) : super(key: key);

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  late PersistentTabController _controller;
  @override
  void initState() {
    super.initState();

    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Styles.backgroundColor!,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Styles.backgroundColor!,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 200), curve: Curves.ease),
      screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200)),
      navBarStyle: NavBarStyle.style12,
    );
  }
}

List<Widget> _buildScreens() {
  return [
    HomePage(),
    const WalletPage(),
    const TradesPage(),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return <PersistentBottomNavBarItem>[
    item(CupertinoIcons.home, ("Home")),
    item(Icons.wallet_giftcard, ("Wallet")),
    item(Icons.graphic_eq_rounded, ("Trades")),
  ];
}

PersistentBottomNavBarItem item(IconData icon, String title) =>
    PersistentBottomNavBarItem(
      icon: Icon(icon, color: Styles.primaryColorLight!, size: 20),
      inactiveIcon: Icon(icon, color: CupertinoColors.systemGrey, size: 18.5),
      title: title,
      activeColorPrimary: Styles.primaryColor!,
      inactiveColorPrimary: CupertinoColors.systemGrey,
      activeColorSecondary: Styles.primaryColor!,
      inactiveColorSecondary: CupertinoColors.systemGrey,
    );
