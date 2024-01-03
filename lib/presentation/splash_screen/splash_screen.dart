import 'dart:async';

import 'package:boxing_traning/common/kdbug_log.dart';
import 'package:boxing_traning/common/shared_widgets/base_scaffold.dart';
import 'package:boxing_traning/common/shared_widgets/common_button.dart';
import 'package:boxing_traning/config/routers/router_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final Timer timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialization();
  }

  void initialization() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    // ignore_for_file: avoid_print
    kDebugLog('ready in 3...');
    await Future.delayed(const Duration(seconds: 1));
    kDebugLog('ready in 2...');
    await Future.delayed(const Duration(seconds: 1));
    kDebugLog('ready in 1...');
    await Future.delayed(const Duration(seconds: 1)).then((value) {
      FlutterNativeSplash.remove();
      context.goNamed(RouterPath.homeScreen);
    });
    print('go!');
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    // timer = Timer(const Duration(seconds: 2), () {
    //   context.pushReplacementNamed(RouterPath.homeScreen);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        body: Column(
      children: [
        CommonButton(
          title: 'Go to Home',
          onPress: () => context.pushNamed(RouterPath.homeScreen),
        )
      ],
    ));
  }
}
