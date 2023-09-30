import 'package:flutter/material.dart';

import 'package:twitter_clone_api/services/router_config.dart';

// Dans la console : flutter pub add http

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // Utiliser la variable goRouter importée de router_config.dart
      routerConfig: goRouter,
      title: 'Twitter Clone API',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}


/*
-------------- OBSERVERS ------------------------------------------------------
import 'package:flutter/material.dart';
import 'router_config.dart'; // Importer la configuration du routeur

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Utiliser les valeurs du routeur configuré dans router_config.dart
      navigatorKey: AppRouter.navigatorKey,
      builder: AppRouter.builder,
      navigatorObservers: AppRouter.navigatorObservers,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
    );
  }
}
*/