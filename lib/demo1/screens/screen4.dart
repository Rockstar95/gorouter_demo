import 'package:flutter/material.dart';

class Screen4 extends StatefulWidget {
  final String id;

  const Screen4({Key? key, required this.id}) : super(key: key);

  @override
  State<Screen4> createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen4"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Screen4'),
            Text('id:${widget.id}'),
          ],
        ),
      ),
    );
  }
}
