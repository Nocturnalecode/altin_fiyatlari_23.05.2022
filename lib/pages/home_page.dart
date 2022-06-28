import 'package:altin_fiyatlari/UIHelper/ui_helper.dart';
import 'package:altin_fiyatlari/pages/add_favorites_page.dart';
import 'package:altin_fiyatlari/services/merged_api.dart';
import 'package:altin_fiyatlari/widgets/home_page_list_item.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/merged_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<MergedModel>> _mergedListFuture;
  late AsyncSnapshot<List<MergedModel>> _listem;
  List<String> addedItems = [];

  @override
  void initState() {
    super.initState();
    _mergedListFuture = MergedApi.getCurrencyData();
    loadFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MergedModel>>(
      future: _mergedListFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          _listem = snapshot;
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Error in home_page.dart FutureBuilder"),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return HomePageListItem(
          listem: _listem,
        );
      },
    );
  }

  String getValueChangeStatus(String degisim) {
    if (degisim.contains("-")) {
      return "images/downarrow.gif";
    } else {
      return "images/uparrow.gif";
    }
  }

  void loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList("curList") != null) {
      addedItems = prefs.getStringList("curList")!;
    }
  }

  void addItemsToList() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString("currency") != null) {
      addedItems.add(prefs.getString("currency")!);
    }
    prefs.setStringList("curList", addedItems);
  }

  void goToSecondScreen(context) async {
    final prefs = await SharedPreferences.getInstance();
    var turnedValue = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => AddFavoritesPage(context),
          fullscreenDialog: true,
        ));
    if (turnedValue != null) {
      prefs.setString("currency", turnedValue);
    }
    setState(() {
      addItemsToList();
    });
  }

  Future<void> removeFromPref() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setStringList("curList", addedItems);
      loadFavorites();
    });
  }

  Widget buildItem(MergedModel e) {
    return Card(
      key: ValueKey(e),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 10,
      shadowColor: Colors.grey,
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: Colors.grey.shade100),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(
                            bottom: 8, top: 1, right: 3, left: 3),
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            border: Border.all(),
                            borderRadius: const BorderRadius.horizontal(),
                            color: Colors.amber,
                          ),
                          child:
                              Text(UIHelper.getStringFromStringCurrency(e.cur),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  )),
                        ),
                      )),
                      Expanded(
                          child: Text(
                        "Alış: " + e.buy,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )),
                      Expanded(
                          child: Text("Satış: " + e.sell,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18))),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(getValueChangeStatus(e.diff)),
                          Text(e.diff.toString()),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.amber.shade600,
                            ),
                            child: TextButton(
                                onPressed: () {
                                  addedItems.removeWhere(
                                      (element) => element == e.cur);
                                  removeFromPref();
                                },
                                child: const Text(
                                  "Sil",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                )),
                          ),
                        ],
                      )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
