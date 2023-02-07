import 'package:flutter/material.dart';
import 'package:gorouter_demo/demo1/configs/demo1_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      // routeInformationProvider: EcommerceConfigs.getRouter().routeInformationProvider,
      // routeInformationParser: EcommerceConfigs.getRouter().routeInformationParser,
      // routerDelegate: EcommerceConfigs.getRouter().routerDelegate,

      routeInformationProvider: Demo1Routes.getRouter().routeInformationProvider,
      routeInformationParser: Demo1Routes.getRouter().routeInformationParser,
      routerDelegate: Demo1Routes.getRouter().routerDelegate,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
