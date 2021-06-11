import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../export.dart';

class PlatformScaffold extends PlatformWidget<CupertinoPageScaffold, Scaffold>{
  final PlatformAppBar appBar;
  final Color backgroundColor;
  final Widget body;

  PlatformScaffold({
    this.appBar,
    this.backgroundColor = const Color(0xFF31359B),
    @required this.body,
  });

  @override
  Scaffold buildAndroid(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: appBar,
      body: body,
    );
  }

  @override
  CupertinoPageScaffold buildIOS(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: backgroundColor,
      navigationBar: appBar,
      child: body,
    );
  }
}
