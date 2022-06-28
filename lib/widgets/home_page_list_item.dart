import 'package:altin_fiyatlari/models/merged_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../UIHelper/ui_helper.dart';
import '../pages/add_favorites_page.dart';

class HomePageListItem extends StatefulWidget {
  final AsyncSnapshot<List<MergedModel>> listem;
  const HomePageListItem({Key? key, required this.listem}) : super(key: key);

  @override
  State<HomePageListItem> createState() => _HomePageListItemState();
}

class _HomePageListItemState extends State<HomePageListItem> {
  List<String> addedItems = [];
  List<MergedModel> myList = [];

  @override
  void initState() {
    super.initState();
    debugPrint("init");
    loadFavorites();
  }

  @override
  Widget build(BuildContext context) {
    if (myList != []) {
      myList = widget.listem.data!.where(
        (element) {
          for (var i in addedItems) {
            if (element.cur == i) {
              return true;
            }
          }
          return false;
        },
      ).toList();
    }

    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.centerLeft,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.black87,
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Favoriler",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 8,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: GridView.count(
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 1,
                crossAxisCount: 2,
                children: myList.map((e) => buildItem(e)).toList() +
                    [
                      Card(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        color: Colors.grey.shade400,
                        elevation: 10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(100)),
                              child: Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40)),
                                      primary: Colors.amber),
                                  onPressed: () {
                                    goToSecondScreen(context);
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.only(
                                        top: 8, bottom: 8, right: 7, left: 7),
                                    child: Text(
                                      "+",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 40,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
          ),
        ),
      ],
    );
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

  void addItemsToList() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString("currency") != null) {
      addedItems.add(prefs.getString("currency")!);
    }
    prefs.setStringList("curList", addedItems);
  }

  String getValueChangeStatus(String degisim) {
    if (degisim.contains("-")) {
      return "images/downarrow.gif";
    } else {
      return "images/uparrow.gif";
    }
  }

  Future<void> removeFromPref() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setStringList("curList", addedItems);
      loadFavorites();
    });
  }

  void loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    addedItems = prefs.getStringList("curList") ?? [];
    setState(() {});
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
                            bottom: 8, top: 1, right: 1, left: 1),
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
                                  maxLines: 1,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  )),
                        ),
                      )),
                      Expanded(
                          child: Text(
                        "Alış: " + e.buy,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                      Expanded(
                          child: Text("Satış: " + e.sell,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18))),
                      Expanded(
                          child: Text("Fark: " + e.diff,
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14))),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(getValueChangeStatus(e.diff)),
                          Container(
                            alignment: Alignment.topCenter,
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.amber.shade600,
                            ),
                            child: TextButton(
                                style: TextButton.styleFrom(
                                    padding: const EdgeInsets.all(2)),
                                onPressed: () {
                                  addedItems.removeWhere(
                                      (element) => element == e.cur);
                                  removeFromPref();
                                },
                                child: const Text(
                                  "Sil",
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
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
