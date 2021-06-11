import 'dart:async';
import 'package:domain/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_better_camera/camera.dart';
import 'package:provider/provider.dart';
import 'export.dart';

List<CameraDescription> cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runZonedGuarded(
    () async {
      await initializeDependencies();
      cameras = await availableCameras();
      runApp(EnvisionApp());
    },
    (Object error, StackTrace stackTrace) {
      print(error);
    },
  );
}

class EnvisionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: multiProviders,
      child: PlatformApp(
        home: SplashPage(),
        initialRoute: AppRoutes.splashPage,
        onGenerateRoute: AppRoutes.appRoutes,
      ),
    );
  }
}
