import 'package:boxing_traning/common/global/global_key.dart';
import 'package:boxing_traning/common/shared_widgets/scafold_with_nav_bar/scafold_with_nav_bar.dart';
import 'package:boxing_traning/config/routers/router_name.dart';
import 'package:boxing_traning/domain/models/martial_template.dart';
import 'package:boxing_traning/presentation/history_screen/history_cubit.dart';
import 'package:boxing_traning/presentation/history_screen/history_screen.dart';
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

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _sectionNavigatorKey = GlobalKey<NavigatorState>();
final GoRouter routerManage = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: '/',
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        // Return the widget that implements the custom shell (e.g a BottomNavigationBar).
        // The [StatefulNavigationShell] is passed to be able to navigate to other branches in a stateful way.
        return ScaffoldWithNavbar(navigationShell);
      },
      branches: [
        // The route branch for the 1º Tab
        StatefulShellBranch(
          navigatorKey: _sectionNavigatorKey,

          // Add this branch routes
          // each routes with its sub routes if available e.g feed/uuid/details
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
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
// Change the opacity of the screen using a Curve based on the the animation's value
                    return FadeTransition(
                      opacity: CurveTween(curve: Curves.easeInOutCirc)
                          .animate(animation),
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
                }),
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
        ),

        // The route branch for 2º Tab
        StatefulShellBranch(routes: <RouteBase>[
          // Add this branch routes
          // each routes with its sub routes if available e.g shope/uuid/details
          GoRoute(
            path: RouterPath.history,
            builder: (context, state) => BlocProvider(
              create: (context) => HistoryCubit(),
              child: HistoryScreen(),
            ),
          ),
        ])
      ],
    ),
    // GoRoute(
    //   path: '/',
    //   builder: (BuildContext context, GoRouterState state) {
    //     return BlocProvider(
    //       create: (context) => HomeCubit(),
    //       child: const SplashScreen(),
    //     );
    //   },
    // ),
    // GoRoute(
    //   path: RouterPath.homeScreen,
    //   builder: (BuildContext context, GoRouterState state) {
    //     return BlocProvider(
    //       create: (context) => HomeCubit(),
    //       child: const HomeScreen(),
    //     );
    //   },
    // ),
    // GoRoute(
    //     path: RouterPath.timingScreen,
    //     name: RouterPath.timingScreen,
    //     builder: (BuildContext context, GoRouterState state) {
    //       final martialArtModel = state.extra;
    //
    //       return BlocProvider(
    //         create: (context) =>
    //             TimingCubit(martialArtModel as MartialTemplate),
    //         child: const TimingScreen(),
    //       );
    //     }),
    // GoRoute(
    //   path: RouterPath.setupScreen,
    //   name: RouterPath.setupScreen,
    //   builder: (BuildContext context, GoRouterState state) {
    //     final setupParams = state.extra as SetupScreenParams;
    //     return BlocProvider(
    //       create: (context) => SetupCubit(martial: setupParams.martial),
    //       child: SetupScreen(
    //         setupParams: setupParams,
    //       ),
    //     );
    //   },
    // ),
    // GoRoute(
    //   path: RouterPath.martialDetail,
    //   name: RouterPath.martialDetail,
    //   builder: (BuildContext context, GoRouterState state) {
    //     final martial = state.extra as MartialTemplate;
    //     return BlocProvider(
    //       create: (context) => MartialTrainingCubit(),
    //       child: MartialTrainingDetail(martial: martial),
    //     );
    //   },
    // ),
  ],
);
