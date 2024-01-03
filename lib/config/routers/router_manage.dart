import 'package:boxing_traning/common/global/global_key.dart';
import 'package:boxing_traning/config/routers/router_name.dart';
import 'package:boxing_traning/domain/models/martial_template.dart';
import 'package:boxing_traning/presentation/home_screen/home_cubit.dart';
import 'package:boxing_traning/presentation/home_screen/home_screen.dart';
import 'package:boxing_traning/presentation/martial_training_detail/martial_training_cubit.dart';
import 'package:boxing_traning/presentation/martial_training_detail/martial_training_detail.dart';
import 'package:boxing_traning/presentation/setup_screen/setup_cubit.dart';
import 'package:boxing_traning/presentation/setup_screen/setup_screen.dart';
import 'package:boxing_traning/presentation/splash_screen/splash_screen.dart';
import 'package:boxing_traning/presentation/timing_screen/timing_cubit.dart';
import 'package:boxing_traning/presentation/timing_screen/timing_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _sectionNavigatorKey =
    GlobalKey<NavigatorState>();

final GoRouter routerManage = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: RouterPath.homeScreen,
      name: RouterPath.homeScreen,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return CustomTransitionPage(
          child: BlocProvider(
            create: (context) => HomeCubit(),
            child: const HomeScreen(),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(
          create: (context) => HomeCubit(),
          child: const SplashScreen(),
        );
      },
    ),
    GoRoute(
      path: RouterPath.timingScreen,
      name: RouterPath.timingScreen,
      builder: (BuildContext context, GoRouterState state) {
        final martialArtModel = state.extra;
        return BlocProvider(
          create: (context) => TimingCubit(martialArtModel as MartialTemplate),
          child: const TimingScreen(),
        );
      },
    ),
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
    // StatefulShellRoute.indexedStack(
    //   builder: (context, state, navigationShell) {
    //     return ScaffoldWithNavbar(navigationShell);
    //   },
    //   branches: [
    //     StatefulShellBranch(
    //       navigatorKey: _sectionNavigatorKey,
    //       routes: <RouteBase>[
    //         GoRoute(
    //           path: RouterPath.homeScreen,
    //           name: RouterPath.homeScreen,
    //           pageBuilder: (BuildContext context, GoRouterState state) {
    //             return CustomTransitionPage(
    //               child: BlocProvider(
    //                 create: (context) => HomeCubit(),
    //                 child: const HomeScreen(),
    //               ),
    //               transitionsBuilder:
    //                   (context, animation, secondaryAnimation, child) {
    //                 return FadeTransition(
    //                   opacity: CurveTween(curve: Curves.easeInOutCirc)
    //                       .animate(animation),
    //                   child: child,
    //                 );
    //               },
    //             );
    //           },
    //         ),
    //         GoRoute(
    //           path: '/',
    //           builder: (BuildContext context, GoRouterState state) {
    //             return BlocProvider(
    //               create: (context) => HomeCubit(),
    //               child: const SplashScreen(),
    //             );
    //           },
    //         ),
    //         GoRoute(
    //           path: RouterPath.timingScreen,
    //           name: RouterPath.timingScreen,
    //           builder: (BuildContext context, GoRouterState state) {
    //             final martialArtModel = state.extra;
    //             return BlocProvider(
    //               create: (context) =>
    //                   TimingCubit(martialArtModel as MartialTemplate),
    //               child: const TimingScreen(),
    //             );
    //           },
    //         ),
    //         GoRoute(
    //           path: RouterPath.setupScreen,
    //           name: RouterPath.setupScreen,
    //           builder: (BuildContext context, GoRouterState state) {
    //             final setupParams = state.extra as SetupScreenParams;
    //             return BlocProvider(
    //               create: (context) => SetupCubit(martial: setupParams.martial),
    //               child: SetupScreen(
    //                 setupParams: setupParams,
    //               ),
    //             );
    //           },
    //         ),
    //         GoRoute(
    //           path: RouterPath.martialDetail,
    //           name: RouterPath.martialDetail,
    //           builder: (BuildContext context, GoRouterState state) {
    //             final martial = state.extra as MartialTemplate;
    //             return BlocProvider(
    //               create: (context) => MartialTrainingCubit(),
    //               child: MartialTrainingDetail(martial: martial),
    //             );
    //           },
    //         ),
    //       ],
    //     ),
    //     StatefulShellBranch(
    //       routes: <RouteBase>[
    //         GoRoute(
    //           path: RouterPath.history,
    //           builder: (context, state) => BlocProvider(
    //             create: (context) => HistoryCubit(),
    //             child: HistoryScreen(),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ],
    // ),
  ],
);
