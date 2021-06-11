import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../export.dart';

PageRoute platformRoute({
  final Widget child,
  final RouteSettings settings,
}) {
  switch (Platform.isAndroid) {
    case true:
      return MaterialPageRoute(
        builder: (_) => child,
        settings: settings,
      );
    case false:
      return CupertinoPageRoute(
        builder: (_) => child,
        settings: settings,
      );
    default:
      throw UnimplementedError('Platform is not supported!');
  }
}
