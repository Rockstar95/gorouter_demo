import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:gorouter_demo/demo1/screens/main_page.dart';
import 'package:gorouter_demo/demo1/screens/screen1.dart';
import 'package:gorouter_demo/demo1/screens/screen2.dart';
import 'package:gorouter_demo/demo1/screens/screen3.dart';
import 'package:gorouter_demo/demo1/screens/screen4.dart';
import 'package:gorouter_demo/demo1/screens/screen5.dart';
import 'package:gorouter_demo/demo1/screens/splash_screen.dart';

/// Shared paths / urls used across the app
class ScreenPaths {
  static String root = '/';
  static String screen1 = '/screen1';
  static String screen2 = '/screen2';
  static String screen3(String text, {int tabIndex = 0}) => 'screen3/$text?t=$tabIndex';
  static String screen4(String id) => '/screen4/$id';
  static String screen5(String highlightId) => '/screen5/$highlightId';
}

class Demo1Routes {
  static GoRouter? goRouter;

  static final GlobalKey<NavigatorState> _shellNavigator = GlobalKey(debugLabel: 'shell');

  static GoRouter getRouter() {
    if(goRouter == null) {
      initializeRouter();
    }
    return goRouter!;
  }

  static GoRouter initializeRouter([GoRouter? router]) {
    goRouter = router ?? GoRouter(
      debugLogDiagnostics: false,
      redirect: _handleRedirect,
      urlPathStrategy: UrlPathStrategy.path,
      // navigatorBuilder: (_, __, child) => WondersAppScaffold(child: child),
      routes: [
        AppRoute(
          path: ScreenPaths.root,
          builder: (_) => const SplashScreen(),
        ),
        ShellRoute(
          navigatorKey: _shellNavigator,
          builder: (BuildContext context, GoRouterState state, Widget child) {
            print("MainPage location:${state.location}");

            return MainPage(
              location: state.location,
              child: child,
            );
          },
          routes: [
            AppRoute(
              path: "/MainPage/screen1",
              builder: (_) => const Screen1(),
              routes: [
                AppRoute(
                  path: "screen3/:text",
                  name: "main_page_screen1_screen3",
                  useFade: true,
                  builder: (GoRouterState state) {
                    String text = state.params['text'] as String;
                    int tab = int.tryParse(state.queryParams['t'] ?? '') ?? 0;

                    return Screen3(
                      text: text,
                      initialTabIndex: tab,
                    );
                  },
                  routes: [
                    AppRoute(
                      path: 'screen5/:highlightId',
                      useFade: true,
                      builder: (s) {
                        return Screen5(highlightId: s.params['highlightId'] as String);
                      },
                    ),
                  ],
                ),
                AppRoute(
                  path: 'screen4/:id',
                  builder: (s) {
                    return Screen4(id: s.params['id']!);
                  },
                ),
              ],
            ),
            AppRoute(
              path: "/MainPage/screen2",
              builder: (_) => const Screen2(),
            ),
            AppRoute(
              path: "/MainPage/screen3/:text",
              builder: (GoRouterState state) {
                String text = state.params['text'] as String;
                int tab = int.tryParse(state.queryParams['t'] ?? '') ?? 0;

                return Screen3(
                  text: text,
                  initialTabIndex: tab,
                );
              },
            ),
          ],
        ),
      ],
    );
    return goRouter!;
  }

  static String? _handleRedirect(GoRouterState state) {
    debugPrint("_handleRedirect called for:'${state.location}'");

    // Prevent anyone from navigating away from `/` if app is starting up.
    /*if (!appLogic.isBootstrapComplete && state.location != ScreenPaths.splash) {
      return ScreenPaths.splash;
    }*/
    debugPrint("Navigating to:'${state.location}'");
    return null; // do nothing
  }

  /*static GoRouter initializeRouter([GoRouter? router]) {
    goRouter = router ?? GoRouter(
      debugLogDiagnostics: false,
      redirect: _handleRedirect,
      urlPathStrategy: UrlPathStrategy.path,
      // navigatorBuilder: (_, __, child) => WondersAppScaffold(child: child),
      routes: [
        AppRoute(
          path: ScreenPaths.root,
          builder: (_) => const SplashScreen(),
        ),
        AppRoute(
          name: "myscreen1",
          path: ScreenPaths.screen1,
          builder: (GoRouterState state) {
            // print("Name:${state.name}");
            // print("Path:${state.path}");
            // print("Params:${state.params}");
            // print("queryParams:${state.queryParams}");
            // print("extra:${state.extra}");
            // print("fullpath:${state.fullpath}");
            return const Screen1();
          },
        ),
        AppRoute(
          path: ScreenPaths.screen2,
          builder: (_) => const Screen2(),
        ),
        AppRoute(
          path: '/screen3/:text',
          builder: (s) {
            String text = s.params['text'] as String;
            int tab = int.tryParse(s.queryParams['t'] ?? '') ?? 0;

            return Screen3(
              text: text,
              initialTabIndex: tab,
            );
          },
          useFade: true,
        ),
        AppRoute(
          path: '/screen4/:id',
          builder: (s) {
            return Screen4(id: s.params['id']!);
          },
        ),
        AppRoute(
          path: '/screen5/:highlightId',
          builder: (s) {
            return Screen5(highlightId: s.params['highlightId'] as String);
          },
        ),
      ],
    );
    return goRouter!;
  }*/
}

/// Custom GoRoute sub-class to make the router declaration easier to read
class AppRoute extends GoRoute {
  AppRoute({
    String? name,
    required path,
    required Widget Function(GoRouterState s) builder,
    List<RouteBase> routes = const [],
    this.useFade = false,
  }) : super(
    name: name,
    path: path,
    routes: routes,
    pageBuilder: (context, state) {
      final pageContent = builder(state);
      if (useFade) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: pageContent,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      }
      return CupertinoPage(child: pageContent);
    },
  );
  final bool useFade;
}
