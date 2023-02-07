import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gorouter_demo/ecommerce/screens/categories_screen.dart';
import 'package:gorouter_demo/ecommerce/screens/product_list_screen.dart';
import 'package:gorouter_demo/ecommerce/screens/splash_sreen.dart';

class EcommerceConfigs {
  static GoRouter? goRouter;

  static GoRouter getRouter() {
    if(goRouter == null) {
      initializeRouter();
    }
    return goRouter!;
  }

  static GoRouter initializeRouter([GoRouter? router]) {
    goRouter = router ?? GoRouter(
      redirect: _handleRedirect,
      routes: <RouteBase>[
        GoRoute(
          path: "/categories",
          name: "categories",
          builder: (BuildContext context, GoRouterState state) {
            print("CategoriesScreen Page Key:'${state.pageKey.value}'");
            return const CategoriesScreen();
          },
          routes: <GoRoute>[
            GoRoute(
              path: "product_list/:category",
              name: "category_product_list",
              builder: (BuildContext context, GoRouterState state) {
                print("category_product_list Page Key:'${state.pageKey.value}'");
                return ProductListScreen(
                  category: state.params['category']!,
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: "/product_list/:category",
          name: "product_list",
          builder: (BuildContext context, GoRouterState state) {
            return ProductListScreen(
              category: state.params['category']!,
            );
          },
        ),
        GoRoute(
          path: "/",
          name: "root",
          builder: (BuildContext context, GoRouterState state) {
            print("Splash Screen Page Key:'${state.pageKey.value}'");
            return const SplashScreen();
          },
        ),
        /*ShellRoute(
          builder: (BuildContext context, GoRouterState state, Widget child) {
          },
        ),*/
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
}