import 'package:altin_fiyatlari/UIHelper/route_generator.dart';
import 'package:altin_fiyatlari/UIHelper/ui_helper.dart';
import 'package:altin_fiyatlari/pages/foreign_currency_page.dart';
import 'package:altin_fiyatlari/pages/gold_page.dart';
import 'package:altin_fiyatlari/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        theme: ThemeData(fontFamily: 'RobotoSlab'),
        home: const MyStatefulWidget(),
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
  late HomePage pageSettings;
  @override
  void initState() {
    super.initState();
    pageSettings = const HomePage();
    pageGold = const GoldPage();
    pageCurrency = const ForeignCurrencyPage();

    allPages = [pageSettings, pageGold, pageCurrency];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          UIHelper.updateDate(UIHelper.updateText),
          style: const TextStyle(color: Colors.black87, fontSize: 17),
        ),
        backgroundColor: Colors.amber[600],
      ),
      body: allPages[selectedMenuItem],
      bottomNavigationBar: bottomNavMenu(),
      backgroundColor: Colors.grey.shade300,
    );
  }

  WillPopScope bottomNavMenu() {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.favorite_sharp),
            label: 'Favoriler',
            backgroundColor: Colors.blueGrey[800],
          ),
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
        ],
        selectedItemColor: Colors.amber[700],
        currentIndex: selectedMenuItem,
        onTap: (index) {
          setState(() {
            selectedMenuItem = index;
          });
        },
      ),
    );
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Uygulamadan çıkmak mı istiyorsunuz?'),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                    elevation: 10,
                    backgroundColor: Colors.green.withOpacity(0.6)),
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Hayır',
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
              TextButton(
                style: TextButton.styleFrom(
                    elevation: 10,
                    backgroundColor: Colors.red.withOpacity(0.6)),
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text(
                  'Evet',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        )) ??
        false;
  }
}
