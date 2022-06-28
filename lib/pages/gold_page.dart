import 'package:altin_fiyatlari/pages/home_page.dart';
import 'package:altin_fiyatlari/widgets/gold_list.dart';
import 'package:flutter/material.dart';

import 'add_favorites_page.dart';
import 'foreign_currency_page.dart';

class GoldPage extends StatefulWidget {
  const GoldPage({Key? key}) : super(key: key);

  @override
  State<GoldPage> createState() => _GoldPageState();
}

class _GoldPageState extends State<GoldPage> {
  int selectedMenuItem = 0;
  late List<Widget> allPages;
  late GoldPage pageGold;
  late AddFavoritesPage pageCalculate;
  late ForeignCurrencyPage pageCurrency;
  late HomePage pageSettings;
  @override
  void initState() {
    super.initState();
    pageGold = const GoldPage();
    pageCalculate = AddFavoritesPage(context);
    pageCurrency = const ForeignCurrencyPage();
    pageSettings = const HomePage();

    allPages = [pageGold, pageCalculate, pageCurrency, pageSettings];
  }
  @override
  Widget build(BuildContext context) {
    return const Center(
        child: GoldList(),
        );
  }

}
