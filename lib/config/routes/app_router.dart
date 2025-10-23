import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:machine_test_superlabs/config/routes/routes.dart';
import 'package:machine_test_superlabs/src/features/auth/presentaion/splash_screen.dart';
import 'package:machine_test_superlabs/src/features/product_search/presentation/pages/search_page.dart';

class NavigationService {
  // final GlobalKey<NavigatorState> _shellNavigatorKey =
  //     GlobalKey<NavigatorState>(debugLabel: 'shell');
  final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');

  late final GoRouter router;

  NavigationService() {
    router = GoRouter(
      navigatorKey: navigatorKey,
      initialLocation: Routes.splash,
      routes: [
        // ShellRoute(
        //   navigatorKey: _shellNavigatorKey,
        //   builder: (context, state, child) {
        //     return NavBarScreen(child: child);
        //   },
        //   routes: [
        //     GoRoute(
        //       path: Routes.home,
        //       name: RouteNames.home,
        //       builder: (context, state) => const HomeScreen(),
        //     ),
        //     GoRoute(
        //       path: Routes.hub,
        //       name: RouteNames.hub,
        //       builder: (context, state) => const HubScreen(),
        //     ),
        //     GoRoute(
        //       path: Routes.market,
        //       name: RouteNames.market,
        //       builder: (context, state) => const MarketPlaceScreen(),
        //     ),
        //     GoRoute(
        //       path: Routes.dealerCollab,
        //       name: RouteNames.dealerCollab,
        //       builder: (context, state) => const DealersCollabScreen(),
        //     ),
        //     GoRoute(
        //       path: Routes.more,
        //       name: RouteNames.more,
        //       builder: (context, state) => const MoreScreen(),
        //     ),
        //   ],
        // ),
        GoRoute(
          path: Routes.splash,
          name: RouteNames.splash,
          builder: (context, state) => const SplashScreen(),
        ),

        GoRoute(
          path: Routes.search,
          name: RouteNames.search,
          builder: (context, state) =>  SearchPage(),
        ),
      ],
    );
  }
}




