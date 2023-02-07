import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../configs/demo1_routes.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen1"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Screen1'),
            ElevatedButton(
              onPressed: () {
                context.go("/MainPage/screen1/screen3/Hello world?t=2");

                /*context.goNamed(
                  "main_page_screen1_screen3",
                  params: {
                    "text" : "Hello world",
                  },
                  queryParams: {
                    "t" : "1",
                  },
                );*/
                // appRouter.go("/${ScreenPaths.screen3("hello", tabIndex: 2)}");
              },
              child: const Text("Screen3"),
            ),
            ElevatedButton(
              onPressed: () {
                context.go("/MainPage/screen1/screen4/13");

                // context.go(ScreenPaths.screen4("10"));
                // appRouter.go("/${ScreenPaths.screen3("hello", tabIndex: 2)}");
              },
              child: const Text("Screen4"),
            ),
          ],
        ),
      ),
    );
  }
}
