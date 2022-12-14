import 'package:clothes/utilities/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../controllers/database_controller.dart';
import '../views/pages/auth_page.dart';
import '../views/pages/bottom_navbar.dart';
import '../views/pages/checkout/add_shippind_address_page.dart';
import '../views/pages/checkout/checkout_page.dart';
import '../views/pages/landing_page.dart';
import '../views/pages/product_details.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.loginPageRoute:
      return CupertinoPageRoute(
        builder: (_) => const AuthPage(),
        settings: settings,
      );
    case AppRoutes.bottomNavBarRoute:
      return CupertinoPageRoute(
        builder: (_) => const BottomNavbar(),
        settings: settings,
      );
    case AppRoutes.checkoutPageRoute:
      final database = settings.arguments as Database;
      return CupertinoPageRoute(
        builder: (_) => Provider<Database>.value(
            value: database, child: const CheckoutPage()),
        settings: settings,
      );
    case AppRoutes.productDetailsRoute:
      final args = settings.arguments as Map<String, dynamic>;
      final product = args['product'];
      final database = args['database'];
      return CupertinoPageRoute(
        builder: (_) => Provider<Database>.value(
          value: database,
          child: ProductDetails(product: product),
        ),
        settings: settings,
      );
    case AppRoutes.addShippingAddressRoute:
      final database = settings.arguments as Database;
      return CupertinoPageRoute(
        builder: (_) => Provider<Database>.value(
          value: database,
          child: const AddShippingAddressPage(),
        ),
        settings: settings,
      );
    case AppRoutes.landingPageRoute:
    default:
      return CupertinoPageRoute(
        builder: (_) => const LandingPage(),
        settings: settings,
      );
  }
}