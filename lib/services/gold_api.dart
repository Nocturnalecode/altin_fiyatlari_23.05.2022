import 'package:altin_fiyatlari/models/gold_model.dart';
import 'package:dio/dio.dart';

import '../UIHelper/ui_helper.dart';

class GoldApi {
  static const String _url = "https://finans.truncgil.com/today.json";

  static Future<List<GoldModel>> getCurrencyData() async {
    List<GoldModel> _list = [];

    var result = await Dio().get(_url);
    final userdata = Map<String, dynamic>.from(result.data);
    if (userdata.containsKey("Update_Date")) {
      UIHelper.updateText = userdata.values.first;
    }
    userdata.removeWhere((key, value) => key == "Update_Date");

    userdata.forEach((key, value) {
      if (value["Tür"] == "Altın") {
        if(key != "ons"){
          _list.add(GoldModel(
            buy: value["Alış"],
            type: value["Tür"],
            sell: value["Satış"],
            diff: value["Değişim"],
            cur: key));
        }
        
      }
    });

    return _list;
  }
}
