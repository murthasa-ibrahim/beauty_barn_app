import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:machine_test_superlabs/config/routes/routes.dart';
import 'package:machine_test_superlabs/src/features/auth/presentaion/splash_screen.dart';
import 'package:machine_test_superlabs/src/features/product_search/presentation/pages/filter_page.dart';
import 'package:machine_test_superlabs/src/features/product_search/presentation/pages/product_detail_page.dart';
import 'package:machine_test_superlabs/src/features/product_search/presentation/pages/search_page.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');

  late final GoRouter router;

  NavigationService() {
    router = GoRouter(
      navigatorKey: navigatorKey,
      initialLocation: Routes.splash,
      routes: [
        GoRoute(
          path: Routes.splash,
          name: RouteNames.splash,
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: Routes.search,
          name: RouteNames.search,
          builder: (context, state) => SearchPage(),
        ),
        GoRoute(
          path: Routes.filter,
          name: RouteNames.filter,
          builder: (context, state) => ProductFilterPage(),
        ),
        GoRoute(
          path: Routes.productDetail,
          name: RouteNames.productDetail,
          builder: (context, state) => const ProductDetailPage(),
        ),
      ],
    );
  }
}
