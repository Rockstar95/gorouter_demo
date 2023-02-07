import 'package:flutter/material.dart';

class Screen5 extends StatefulWidget {
  final String highlightId;

  const Screen5({Key? key, required this.highlightId}) : super(key: key);

  @override
  State<Screen5> createState() => _Screen5State();
}

class _Screen5State extends State<Screen5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen5"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Screen5'),
            Text('highlightId:${widget.highlightId}'),
          ],
        ),
      ),
    );
  }
}
