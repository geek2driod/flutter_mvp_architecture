import 'package:mvp_skeleton/screen/home/home_page.dart';

import '../export.dart';

class AppRoutes {
  static const String splashPage = '/';
  static const String homePage = '/homePage';

  static Route<dynamic> appRoutes(final RouteSettings settings) {
    switch (settings.name) {
      case splashPage:
        return platformRoute(
          child: SplashPage(),
          settings: settings,
        );
      case homePage:
        return platformRoute(
          child: HomePage(),
          settings: settings,
        );
      default:
        throw UnimplementedError('Route is not implemented!');
    }
  }
}
