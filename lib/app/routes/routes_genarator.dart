import 'package:flutter/material.dart';
import 'package:mock_api_demo/app/core/mobx/dashboard/dashboard_store.dart';
import 'package:mock_api_demo/app/routes/paths.dart';

import '../../view/view.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case Paths.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case Paths.dashboardScreen:
        return MaterialPageRoute(builder: (context) => const DashboardScreen());
      case Paths.productScreen:
        return MaterialPageRoute(
            builder: (context) =>
                ProductScreen(store: setting.arguments as DashboardStore));
      case Paths.productDetailScreen:
        return MaterialPageRoute(
            builder: (context) =>
                ProductDetailScreen(data: setting.arguments as Map));
      case Paths.cartScreen:
        return MaterialPageRoute(builder: (context) => const CartScreen());
      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
