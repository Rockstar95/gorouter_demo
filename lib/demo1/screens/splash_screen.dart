import 'package:flutter/material.dart';

import '../configs/demo1_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> navigate() async {
    print("navigate called");
    await Future.delayed(const Duration(seconds: 5));

    Demo1Routes.getRouter().go("/MainPage/screen1");
    // appRouter.goNamed("myscreen1");
    // appRouter.replaceNamed("myscreen1");
    // Demo1Routes.getRouter().goNamed("myscreen1");
    // appRouter.replace("/${ScreenPaths.screen1}", extra: {"name" : "Extra"});
    // appRouter.go("/${ScreenPaths.screen1}", extra: {"name" : "Extra"});
    // appRouter.goNamed("myscreen1");
    // appRouter.go("/${ScreenPaths.screen2}");
    // appRouter.replace("/${ScreenPaths.screen2}");
  }

  @override
  void initState() {
    super.initState();
    navigate();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
