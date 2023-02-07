import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomBar extends StatelessWidget {
  final String location;

  const BottomBar({
    Key? key,
    required this.location,
  }) : super(key: key);

  int getCurrentIndex() {
    if(location.startsWith("/MainPage/screen1")) {
      return 0;
    }
    else if(location.startsWith("/MainPage/screen2")) {
      return 1;
    }
    else if(location.startsWith("/MainPage/screen3")) {
      return 2;
    }
    else {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (int index) {
        if(index == 0) {
          context.go("/MainPage/screen1");
        }
        else if(index == 1) {
          context.go("/MainPage/screen2");
        }
        else if(index == 2) {
          context.go("/MainPage/screen3/Hello");
        }
      },
      currentIndex: getCurrentIndex(),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Screen1",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.podcasts),
          label: "Screen2",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.refresh),
          label: "Screen3",
        ),
      ],
    );
  }
}
