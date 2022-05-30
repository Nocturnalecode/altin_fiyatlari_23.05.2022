import 'package:altin_fiyatlari/UIHelper/route_generator.dart';
import 'package:altin_fiyatlari/pages/calculate_page.dart';
import 'package:altin_fiyatlari/pages/foreign_currency_page.dart';
import 'package:altin_fiyatlari/pages/gold_page.dart';
import 'package:altin_fiyatlari/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        home: MyStatefulWidget(),
        onGenerateRoute: RouteGenerator.routeGenerator);
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int selectedMenuItem = 0;
  late List<Widget> allPages;
  late GoldPage pageGold;
  late ForeignCurrencyPage pageCurrency;
  late SettingsPage pageSettings;
  @override
  void initState() {
    super.initState();
    pageGold = const GoldPage();
    pageCurrency = const ForeignCurrencyPage();
    pageSettings = const SettingsPage();

    allPages = [pageGold, pageCurrency, pageSettings];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Altın / Döviz Fiyatları',
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.amber[600],
      ),
      body: allPages[selectedMenuItem],
      bottomNavigationBar: bottomNavMenu(),
    );
  }

  BottomNavigationBar bottomNavMenu() {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: const FaIcon(FontAwesomeIcons.coins),
          label: 'Altın',
          backgroundColor: Colors.blueGrey[500],
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.euro),
          label: 'Döviz',
          backgroundColor: Colors.blueGrey[700],
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.settings),
          label: 'Ayarlar',
          backgroundColor: Colors.blueGrey[800],
        ),
      ],
      selectedItemColor: Colors.amber[700],
      currentIndex: selectedMenuItem,
      onTap: (index) {
        setState(() {
          selectedMenuItem = index;
        });
      },
    );
  }
}
