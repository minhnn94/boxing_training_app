import 'package:boxing_traning/common/global/global_key.dart';
import 'package:boxing_traning/config/routers/router_name.dart';
import 'package:boxing_traning/domain/models/martial_template.dart';
import 'package:boxing_traning/presentation/home_screen/home_cubit.dart';
import 'package:boxing_traning/presentation/home_screen/home_screen.dart';
import 'package:boxing_traning/presentation/martial_training_detail/martial_training_cubit.dart';
import 'package:boxing_traning/presentation/martial_training_detail/martial_training_detail.dart';
import 'package:boxing_traning/presentation/setup_screen/setup_cubit.dart';
import 'package:boxing_traning/presentation/setup_screen/setup_screen.dart';
import 'package:boxing_traning/presentation/timing_screen/timing_cubit.dart';
import 'package:boxing_traning/presentation/timing_screen/timing_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GoRouter routerManage = GoRouter(
  navigatorKey: navigatorKey,
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(
          create: (context) => HomeCubit(),
          child: HomeScreen(),
        );
      },
    ),
    GoRoute(
        path: RouterPath.timingScreen,
        name: RouterPath.timingScreen,
        builder: (BuildContext context, GoRouterState state) {
          final martialArtModel = state.extra;

          return BlocProvider(
            create: (context) =>
                TimingCubit(martialArtModel as MartialTemplate),
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
        return BlocProvider(
          create: (context) => MartialTrainingCubit(),
          child: MartialTrainingDetail(martial: martial),
        );
      },
    ),
  ],
);
