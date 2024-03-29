import 'package:altin_fiyatlari/models/currency_model.dart';
import 'package:dio/dio.dart';

import '../UIHelper/ui_helper.dart';

class CurrencyApi {
  static const String _url = "https://finans.truncgil.com/today.json";

  static Future<List<CurrencyModel>> getCurrencyData() async {
    List<CurrencyModel> _list = [];

    var result = await Dio().get(_url);
    final userdata = Map<String, dynamic>.from(result.data);
    if (userdata.containsKey("Update_Date")) {
      UIHelper.updateText = userdata.values.first;
    }
    userdata.removeWhere((key, value) => key == "Update_Date");

    userdata.forEach((key, value) {
      if (value["Tür"] == "Döviz") {
        _list.add(CurrencyModel(
            buy: value["Alış"],
            type: value["Tür"],
            sell: value["Satış"],
            diff: value["Değişim"],
            cur: key));
      }
    });

    return _list;
  }
}
