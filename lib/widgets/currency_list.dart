import 'package:flutter/material.dart';
import '../models/currency_model.dart';
import '../services/currency_api.dart';
import 'currency_list_item.dart';

class CurrencyList extends StatefulWidget {
  const CurrencyList({Key? key}) : super(key: key);

  @override
  State<CurrencyList> createState() => _CurrencyListState();
}

class _CurrencyListState extends State<CurrencyList> {
  late Future<List<CurrencyModel>> _currencyListFuture;

  @override
  void initState() {
    super.initState();
    _currencyListFuture = CurrencyApi.getCurrencyData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CurrencyModel>>(
      future: _currencyListFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<CurrencyModel> _myList = snapshot.data!;
          return ListView.builder(
              itemCount: _myList.length,
              itemBuilder: (context, index) =>
                  CurrencyListItem(currency: _myList[index]));
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
