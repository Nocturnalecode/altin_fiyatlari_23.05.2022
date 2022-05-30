import 'dart:convert';

import 'package:altin_fiyatlari/models/currency_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CurrencyApi {
  static const String _url = "https://api.genelpara.com/embed/doviz.json";

  static Future<List<CurrencyModel>> getCurrencyData() async {
    List<CurrencyModel> _list = [];

    var result = await Dio().get(_url);
    var currencyList = jsonDecode(result.data);

    currencyList.forEach((key, value) {
      _list.add(CurrencyModel(
          satis: value["satis"],
          alis: value["alis"],
          degisim: value["degisim"],
          type: key));
    });

    return _list;
  }
}
