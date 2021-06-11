import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../export.dart';

class PlatformApp extends PlatformWidget<CupertinoApp, MaterialApp> {
  PlatformApp({
    @required this.home,
    @required this.initialRoute,
    @required this.onGenerateRoute,
    this.localizationsDelegates,
    this.localeResolutionCallback,
    this.supportedLocales,
  });

  final Widget home;
  final String initialRoute;
  final Function onGenerateRoute;
  final List<LocalizationsDelegate<dynamic>> localizationsDelegates;
  final LocaleResolutionCallback localeResolutionCallback;
  final List<Locale> supportedLocales;


  @override
  MaterialApp buildAndroid(BuildContext context) {
    return MaterialApp(
      title: 'Envision',
      theme: ThemeData(
        accentColor: Color(0xFF40D785),
        primaryColorDark: Color(0xFF31359B),
        primaryColorLight: Color(0xFF6E6BFF),
        indicatorColor: Color(0xFF40D785),
        backgroundColor: Color(0xFF31359B),
        scaffoldBackgroundColor: Color(0xFF31359B),
      ),
      // localizationsDelegates: localizationsDelegates??null,
      // localeResolutionCallback: localeResolutionCallback??null,
      // supportedLocales: supportedLocales??null,
      debugShowCheckedModeBanner: false,
      home: home,
      initialRoute: initialRoute,
      onGenerateRoute: onGenerateRoute,
    );
  }

  @override
  CupertinoApp buildIOS(BuildContext context) {
    return CupertinoApp(
      title: 'Envision',
      theme: CupertinoThemeData(
        primaryColor: Color(0xFF31359B),
        primaryContrastingColor: Color(0xFF40D785),
        scaffoldBackgroundColor: Color(0xFF31359B),
      ),
      // localizationsDelegates: localizationsDelegates??null,
      // localeResolutionCallback: localeResolutionCallback??null,
      // supportedLocales: supportedLocales??null,
      debugShowCheckedModeBanner: false,
      home: home,
      initialRoute: initialRoute,
      onGenerateRoute: onGenerateRoute,
    );
  }


}