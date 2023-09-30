import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:twitter_clone_api/connexion_page.dart';
import 'package:twitter_clone_api/twitter_page.dart';

final goRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const ConnexionPage(),
    ),
    GoRoute(
      path: '/twitter_page/:email',
      builder: (context, state) => TwitterPage(
        state.pathParameters["email"] ?? "",
      ),
    ),
    GoRoute(
      path: '/twitter_page',
      builder: (context, state) {
        if (state.extra != null && state.extra is String) {
          return TwitterPage(
            state.extra as String,
          );
        } else {
          return const TwitterPage("");
        }
      },
    ),
  ],
  errorBuilder: (context, state) => const Scaffold(
    body: Center(child: Text("Mhh... Ca ne sert à rien")),
  ),
);

/*
-------------- OBSERVERS ------------------------------------------------------
import 'package:go_router/go_router.dart';
import 'connexion_page.dart';
import 'twitter_page.dart';

// Créez une instance de GoRouter pour configurer vos routes
final AppRouter = GoRouter(
  initialLocation: "/connection",
  navigatorKey: GlobalKey<NavigatorState>(), // Utilisez une clé de navigateur si nécessaire
  builder: (BuildContext context, BuildContext navBuildContext, GoRouterState state) {
    return MaterialApp(
      home: Scaffold(
        body: state.builder(context, navBuildContext, state),
      ),
    );
  },
  navigatorObservers: <NavigatorObserver>[], // Ajoutez des observateurs de navigation si nécessaire
  initialLocationState: InitialLocationState.none,
  // configurez vos routes
  initialLocationPath: "/connection",
  navigatorFunctions: [
    navigateTo(name: "/connection"),
    navigateTo(name: "/twitter_page"),
  ],
  builderMap: <String, PageBuilder>{
    '/connection': (BuildContext context, GoRouterState state) => ConnexionPage(),
    '/twitter_page': (BuildContext context, GoRouterState state) => TwitterPage(),
  },
);

 */