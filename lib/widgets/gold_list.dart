import 'package:altin_fiyatlari/models/gold_model.dart';
import 'package:altin_fiyatlari/services/gold_api.dart';
import 'package:flutter/material.dart';
import 'gold_list_item.dart';

class GoldList extends StatefulWidget {
  const GoldList({Key? key}) : super(key: key);

  @override
  State<GoldList> createState() => _GoldListState();
}

class _GoldListState extends State<GoldList> {
  late Future<List<GoldModel>> _goldListFuture;

  @override
  void initState() {
    super.initState();
    _goldListFuture = GoldApi.getGoldData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<GoldModel>>(
      future: _goldListFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<GoldModel> _myList = snapshot.data!;
          return ListView.builder(
              itemCount: _myList.length,
              itemBuilder: (context, index) =>
                  GoldListItem(gold: _myList[index]));
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Error Occuired"),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
