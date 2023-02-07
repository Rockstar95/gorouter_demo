import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gorouter_demo/ecommerce/configs/ecommerce_configs.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> navigate() async {
    print("navigate called");
    await Future.delayed(const Duration(seconds: 5));
    EcommerceConfigs.getRouter().goNamed("categories");
    // context.goNamed("categories");
  }

  @override
  void initState() {
    super.initState();
    navigate();
  }

  @override
  void dispose() {
    super.dispose();
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
