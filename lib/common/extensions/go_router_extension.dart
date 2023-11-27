import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

extension GoRouteExtension on BuildContext {
  RouteMatchList getMatchList(GoRouter router) {
    final RouteMatch lastMatch =
        router.routerDelegate.currentConfiguration.last;

    if (lastMatch is ImperativeRouteMatch) {
      return lastMatch.matches;
    } else {
      return router.routerDelegate.currentConfiguration;
    }
  }

  String getCurrentLocation(GoRouter router) {
    final matchList = getMatchList(router);
    final String currentLocation = matchList.uri.toString();
    return currentLocation;
  }

  void popUntilPath(String routePath) {
    final router = GoRouter.of(this);
    String currentLocation = getCurrentLocation(router);
    while (currentLocation != routePath) {
      if (!router.canPop()) {
        return;
      }
      debugPrint('Popping $currentLocation');
      router.pop();
      currentLocation = getCurrentLocation(router);
    }
  }
}
