import 'package:altin_fiyatlari/pages/calculate_page.dart';
import 'package:altin_fiyatlari/pages/foreign_currency_page.dart';
import 'package:altin_fiyatlari/pages/gold_page.dart';
import 'package:altin_fiyatlari/pages/settings_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic>? _createRoute(Widget route, RouteSettings settings) {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return CupertinoPageRoute(
        settings: settings,
        builder: (context) => route,
      );
    } else if (defaultTargetPlatform == TargetPlatform.android) {
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => route,
      );
    } else {
      return CupertinoPageRoute(
        settings: settings,
        builder: (context) => route,
      );
    }
  }

  static Route<dynamic>? routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return _createRoute(const GoldPage(), settings);
      case "/currency":
        return _createRoute(const ForeignCurrencyPage(), settings);
      case "/settings":
        return _createRoute(const SettingsPage(), settings);
      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                  appBar: AppBar(title: const Text("404")),
                  body: const Center(
                    child: Text("SAYFA BULUNAMADI"),
                  ),
                ));
    }
  }
}
