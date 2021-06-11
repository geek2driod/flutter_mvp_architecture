import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvp_skeleton/export.dart';

class PlatformAppBar extends PlatformWidget<CupertinoNavigationBar, AppBar>
    with ObstructingPreferredSizeWidget {
  final bool automaticallyImplyLeading;
  final Widget leading;
  final Color backgroundColor;
  final Widget title;
  final List<Widget> actions;

  PlatformAppBar({
    this.automaticallyImplyLeading = false,
    this.leading,
    this.backgroundColor,
    this.title,
    this.actions,
  });

  @override
  AppBar buildAndroid(BuildContext context) {
    return AppBar(
      leading: leading,
      elevation: 0,
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: automaticallyImplyLeading,
      title: title,
    );
  }

  @override
  CupertinoNavigationBar buildIOS(BuildContext context) {
    return CupertinoNavigationBar(
      leading: leading,
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: automaticallyImplyLeading,
      middle: title,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  bool shouldFullyObstruct(BuildContext context) => true;
}
