import 'package:dio/dio.dart';
import '../UIHelper/ui_helper.dart';
import '../models/merged_model.dart';

class MergedApi {
  static const String _url = "https://finans.truncgil.com/today.json";

  static Future<List<MergedModel>> getCurrencyData() async {
    List<MergedModel> _list = [];

    var result = await Dio().get(_url);
    final userdata = Map<String, dynamic>.from(result.data);
    if (userdata.containsKey("Update_Date")) {
      UIHelper.updateText = userdata.values.first;
    }
    userdata.removeWhere((key, value) => key == "Update_Date");

    userdata.forEach((key, value) {
      if (key != "ons") {
        _list.add(MergedModel(
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
