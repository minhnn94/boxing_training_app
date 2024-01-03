// import 'package:boxing_traning/common/extensions/go_router_extension.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:go_router/go_router.dart';
//
// class MockRouterDelegate extends RouterDelegate<GoRouterState>
//     with PopNavigatorRouterDelegateMixin<GoRouterState> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
//
//   @override
//   Future<void> setNewRoutePath(configuration) async {}
//
//   @override
//   void addListener(VoidCallback listener) {
//     // TODO: implement addListener
//   }
//
//   @override
//   // TODO: implement navigatorKey
//   GlobalKey<NavigatorState>? get navigatorKey => throw UnimplementedError();
//
//   @override
//   void removeListener(VoidCallback listener) {
//     // TODO: implement removeListener
//   }
// }
//
// void main() {
//   test('getMatchList returns correct RouteMatchList', () {
//     // Arrange
//     final router = GoRouter(routerDelegate: MockRouterDelegate(), routes: []);
//     final context = MockBuildContext();
//
//     // Act
//     final matchList = context.getMatchList(router);
//
//     // Assert
//     expect(matchList, isNotNull);
//     // Add more assertions based on your requirements
//   });
//
//   test('getCurrentLocation returns correct current location', () {
//     // Arrange
//     final router = GoRouter(routerDelegate: MockRouterDelegate(), routes: []);
//     final context = MockBuildContext();
//
//     // Act
//     final currentLocation = context.getCurrentLocation(router);
//
//     // Assert
//     expect(currentLocation, isNotNull);
//     // Add more assertions based on your requirements
//   });
//
//   test('popUntilPath pops until the specified route path', () {
//     // Arrange
//     final router = GoRouter(routerDelegate: MockRouterDelegate());
//     final context = MockBuildContext();
//     // Set up your initial route configuration
//     router.go('/first');
//     router.go('/second');
//     router.go('/third');
//
//     // Act
//     context.popUntilPath('/first');
//
//     // Assert
//     // Add assertions based on your requirements, e.g., check the current route
//   });
// }
//
// class MockBuildContext extends Mock implements BuildContext {}
