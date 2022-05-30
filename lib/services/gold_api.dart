import 'dart:convert';

import 'package:altin_fiyatlari/UIHelper/ui_helper.dart';
import 'package:altin_fiyatlari/models/gold_model.dart';
import 'package:dio/dio.dart';

class GoldApi {
  static const String _url = "https://api.genelpara.com/embed/altin.json";

  static Future<List<GoldModel>> getGoldData() async {
    List<GoldModel> _list = [];
    UIHelper;

    var result = await Dio().get(_url);
    var goldList = jsonDecode(result.data);

    goldList.forEach((key, value) {
      _list.add(GoldModel(
          satis: value["satis"],
          alis: value["alis"],
          degisim: value["degisim"],
          type: key));
    });
    return _list;
  }
}
