import 'package:flutter/material.dart';

import 'bottom_bar.dart';

class MainPage extends StatelessWidget {
  final Widget child;
  final String location;

  const MainPage({
    Key? key,
    required this.child,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomBar(
        location: location,
      ),
    );
  }
}
