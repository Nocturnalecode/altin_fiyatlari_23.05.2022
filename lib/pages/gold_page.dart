import 'package:altin_fiyatlari/pages/settings_page.dart';
import 'package:altin_fiyatlari/widgets/gold_list.dart';
import 'package:flutter/material.dart';

import 'calculate_page.dart';
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
  late CalculatePage pageCalculate;
  late ForeignCurrencyPage pageCurrency;
  late SettingsPage pageSettings;
  @override
  void initState() {
    super.initState();
    pageGold = const GoldPage();
    pageCalculate = CalculatePage(imgPath: "images/gold.jpg");
    pageCurrency = const ForeignCurrencyPage();
    pageSettings = const SettingsPage();

    allPages = [pageGold, pageCalculate, pageCurrency, pageSettings];
  }
  @override
  Widget build(BuildContext context) {
    return const Center(
        child: GoldList(),
        );
  }

}
