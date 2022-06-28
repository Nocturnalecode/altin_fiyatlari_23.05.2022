import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/merged_model.dart';

class MergedListItem extends StatefulWidget {
  final ValueChanged<int> update;
  final MergedModel mergedList;
  final List<String> addedItems;
  const MergedListItem(
      {Key? key,
      required this.mergedList,
      required this.addedItems,
      required this.update})
      : super(key: key);

  @override
  State<MergedListItem> createState() => _MergedListItemState();
}

class _MergedListItemState extends State<MergedListItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 3,
      shadowColor: Colors.white,
      color: Colors.purple,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(widget.mergedList.cur),
                ElevatedButton(
                    onPressed: () {
                      widget.addedItems.removeWhere(
                          (element) => element == widget.mergedList.cur);
                      removeFromPref();
                      widget.update(0);
                    },
                    child: const Text("Sil"))
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> removeFromPref() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList("curList", widget.addedItems);
  }
}
