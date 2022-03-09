import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:networking_demo/router.dart';
import 'package:networking_demo/services/navigation_service.dart';
import 'package:networking_demo/ui/views/splash_screen_view.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: NavigationService.instance.navigatorKey,
      onGenerateRoute: Routerr.generateRoutes,
      home: SplashScreenView(),
    );
  }
}
