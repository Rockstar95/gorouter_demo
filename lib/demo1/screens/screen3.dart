import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Screen3 extends StatefulWidget {
  final String text;
  final int initialTabIndex;

  const Screen3({
    Key? key,
    required this.text,
    required this.initialTabIndex,
  }) : super(key: key);

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen3"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Screen3"),
            Text('text: ${widget.text}'),
            Text('initialTabIndex: ${widget.initialTabIndex}'),
            ElevatedButton(
              onPressed: () {
                context.go("/MainPage/screen1/screen3/Hello world/screen5/1234?t=2");

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
              child: const Text("Screen5"),
            ),
          ],
        ),
      ),
    );
  }
}
