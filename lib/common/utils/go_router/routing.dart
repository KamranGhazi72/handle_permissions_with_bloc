
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:handle_permissions_with_bloc/common/utils/go_router/route_name.dart';
import 'package:handle_permissions_with_bloc/features/feature_splash/splash_screen.dart';
import 'package:handle_permissions_with_bloc/features/feature_submit_accident/accident_location/presentation/screen/accident_location_screen.dart';

class Routing {
  static GoRouter router = GoRouter(
    initialLocation: '/splash',
    routes: <RouteBase>[
      GoRoute(
        name: RouteName.splashPage,
        path: '/splash',
        builder: (BuildContext context, GoRouterState state) {
          return SplashScreen();
        },
      ),
      GoRoute(
        name: RouteName.submitAccidentLocationPage,
        path: '/submitAccidentLocation',
        builder: (BuildContext context, GoRouterState state) {
          return AccidentLocationScreen();
        },
      ),
    ],
  );
}