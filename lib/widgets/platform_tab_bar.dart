import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvp_skeleton/export.dart';
import 'package:mvp_skeleton/widgets/export.dart';

class PlatformTabBar extends PlatformWidget<CupertinoTabBar, TabBar> {
  final TabController tabController;
  final List<Widget> materialTabs;
  final List<BottomNavigationBarItem> cupertinoTabs;
  final Function(int) onTap;

  PlatformTabBar({
    this.tabController,
    this.materialTabs,
    this.cupertinoTabs,
    this.onTap,
  });

  @override
  TabBar buildAndroid(BuildContext context) => TabBar(
        controller: tabController,
        onTap: onTap,
        tabs: materialTabs,
        indicatorWeight: 4,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorColor: colors.accentPrimary,
        automaticIndicatorColorAdjustment: false,
      );

  @override
  CupertinoTabBar buildIOS(BuildContext context) => CupertinoTabBar(
        onTap: onTap,
        items: cupertinoTabs,
      );
}
