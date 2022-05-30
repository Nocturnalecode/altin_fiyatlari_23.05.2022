import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../UIHelper/ui_helper.dart';
import '../models/currency_model.dart';

class CurrencyListItem extends StatefulWidget {
  final CurrencyModel currency;
  const CurrencyListItem({Key? key, required this.currency}) : super(key: key);

  @override
  State<CurrencyListItem> createState() => _CurrencyListItemState();
}

class _CurrencyListItemState extends State<CurrencyListItem> {
  @override
  final _controller = TextEditingController();
  var sonuc = 0.0;
  Object? val;
  var currency = "Turkish Lira";

  @override
  void initState() {
    val = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        child: ExpansionTile(
          trailing: SizedBox(
            height: 70,
            width: 70,
            child: Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Text("%" + widget.currency.degisim,
                        style: const TextStyle(fontSize: 14))),
                Expanded(
                    flex: 1,
                    child: Image.asset(
                        getValueChangeStatus(widget.currency.degisim)))
              ],
            ),
          ),
          leading: SizedBox(
            height: 60,
            width: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 1, child: Image.asset("images/money.png")),
                Expanded(
                    flex: 1,
                    child: Text(
                      UIHelper.getStringFromStringCurrency(
                          widget.currency.type),
                      maxLines: 2,
                      style: const TextStyle(
                          fontSize: 13, fontWeight: FontWeight.normal),
                      textAlign: TextAlign.center,
                    )),
              ],
            ),
          ),
          title: Column(
            children: [
              Text("ALIŞ: " +
                  widget.currency.alis +
                  UIHelper.currencyType(currency)),
              Text("SATIŞ: " +
                  widget.currency.satis +
                  UIHelper.currencyType(currency))
            ],
          ),
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Radio(
                                value: 1,
                                groupValue: val,
                                onChanged: (value) {
                                  setState(() {
                                    val = value;
                                    _controller.clear();
                                    sonuc = 0.0;
                                  });
                                }),
                            const Text("ALIŞ")
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                                value: 2,
                                groupValue: val,
                                onChanged: (value) {
                                  setState(() {
                                    val = value;
                                    _controller.clear();
                                    sonuc = 0.0;
                                  });
                                }),
                            const Text("SATIŞ")
                          ],
                        )
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 50,
                    width: 170,
                    child: TextFormField(
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9 .]')),
                      ],
                      controller: _controller,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        labelText: "Değer giriniz",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: const BorderSide(
                              color: Colors.blue,
                            )),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          calculateResult(value, widget.currency);
                        });
                      },
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(25)),
                  alignment: Alignment.center,
                  height: 50,
                  width: 300,
                  child: Text(
                    sonuc.toStringAsFixed(2) + UIHelper.currencyType(currency),
                    style: const TextStyle(fontSize: 30, color: Colors.blue),
                  ),
                )
              ],
            )
          ],
        ));
  }

  double calculateResult(String value, CurrencyModel args) {
    var n = double.tryParse(value);
    if (n != null) {
      debugPrint("done");
      sonuc = (double.parse(value) * double.parse(getValue(args)));
      return sonuc;
    } else {
      debugPrint("wrong");
      return 0;
    }
  }

  String getValue(CurrencyModel args) {
    if (val == 1) {
      return args.alis;
    } else {
      return args.satis;
    }
  }

  String getValueChangeStatus(String degisim) {
    if (degisim.contains("-")) {
      return "images/downarrow.gif";
    } else {
      return "images/uparrow.gif";
    }
  }
}

class ScreenArguments {
  final String alis;
  final String satis;

  ScreenArguments(this.alis, this.satis);
}
