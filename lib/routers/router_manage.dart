import 'package:boxing_traning/common/global/global_key.dart';
import 'package:boxing_traning/routers/router_name.dart';
import 'package:boxing_traning/screens/home_screen/home_screen.dart';
import 'package:boxing_traning/screens/setup_screen/setup_screen.dart';
import 'package:boxing_traning/screens/timing_screen/timing_cubit.dart';
import 'package:boxing_traning/screens/timing_screen/timing_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GoRouter routerManage = GoRouter(
  navigatorKey: navigatorKey,
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
        path: RouterPath.timingScreen,
        name: RouterPath.timingScreen,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => TimingCubit(),
            child: const TimingScreen(),
          );
        }),
    GoRoute(
      path: RouterPath.setupScreen,
      name: RouterPath.setupScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const SetupScreen();
      },
    ),
  ],
);
