import 'package:boxing_traning/common/global/global_key.dart';
import 'package:boxing_traning/models/martial_art_model.dart';
import 'package:boxing_traning/models/martial_template.dart';
import 'package:boxing_traning/routers/router_name.dart';
import 'package:boxing_traning/screens/home_screen/home_screen.dart';
import 'package:boxing_traning/screens/martial_training_detail/martial_training_detail.dart';
import 'package:boxing_traning/screens/setup_screen/setup_cubit.dart';
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
          final martialArtModel = state.extra;

          return BlocProvider(
            create: (context) =>
                TimingCubit(martialArtModel as MartialArtModel),
            child: const TimingScreen(),
          );
        }),
    GoRoute(
      path: RouterPath.setupScreen,
      name: RouterPath.setupScreen,
      builder: (BuildContext context, GoRouterState state) {
        final setupParams = state.extra as SetupScreenParams;
        return BlocProvider(
          create: (context) => SetupCubit(martial: setupParams.martial),
          child: SetupScreen(
            setupParams: setupParams,
          ),
        );
      },
    ),
    GoRoute(
      path: RouterPath.martialDetail,
      name: RouterPath.martialDetail,
      builder: (BuildContext context, GoRouterState state) {
        final martial = state.extra as MartialTemplate;
        return MartialTrainingDetail(martial: martial);
      },
    ),
  ],
);
