import 'package:altin_fiyatlari/UIHelper/ui_helper.dart';
import 'package:altin_fiyatlari/models/gold_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GoldListItem extends StatefulWidget {
  final List<GoldModel> myList;
  const GoldListItem({Key? key, required this.myList}) : super(key: key);

  @override
  State<GoldListItem> createState() => _GoldListItemState();
}

class _GoldListItemState extends State<GoldListItem> {
  final _controller = TextEditingController();
  var sonuc = 0.0;
  Object? val;
  var currency = "Turkish Lira";
  int selected = -1;
  String exchange = "Altın => TL";
  var calc = " TL";
  var enteredValueToCalc = 0.0;

  @override
  void initState() {
    val = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: widget.myList.length,
/*         key: Key('builder ${selected.toString()}'),
 */
        itemBuilder: (context, index) {
          return Card(
              color: Colors.white,
              child: ExpansionTile(
                onExpansionChanged: (value) {
                  if (value) {
                    setState(() {
                      selected = index;
                      calculateResult(
                          enteredValueToCalc.toString(), widget.myList[index]);
                    });
                  }
                },
                /* key: Key(index.toString()),
                initiallyExpanded: index == selected, */
                trailing: SizedBox(
                  height: 70,
                  width: 70,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Text(widget.myList[index].diff,
                              style: const TextStyle(fontSize: 14))),
                      Expanded(
                          flex: 1,
                          child: Image.asset(
                              getValueChangeStatus(widget.myList[index].diff)))
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
                      Expanded(flex: 1, child: Image.asset("images/gold.jpg")),
                      Expanded(
                          flex: 2,
                          child: Text(
                            UIHelper.correctGoldString(
                                widget.myList[index].cur),
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
                        widget.myList[index].buy +
                        UIHelper.currencyType(currency)),
                    Text("SATIŞ: " +
                        widget.myList[index].sell +
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
                                          calculateResult(
                                              enteredValueToCalc.toString(),
                                              widget.myList[index]);
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
                                          calculateResult(
                                              enteredValueToCalc.toString(),
                                              widget.myList[index]);
                                        });
                                      }),
                                  const Text("SATIŞ")
                                ],
                              )
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    if (exchange == "Altın => TL") {
                                      exchange = "TL => Altın";
                                      calc = UIHelper.goldLongtoShort(
                                          widget.myList[index].cur);
                                      calculateResult(
                                          enteredValueToCalc.toStringAsFixed(2),
                                          widget.myList[index]);
                                    } else {
                                      exchange = "Altın => TL";
                                      calc = " TL";
                                      calculateResult(
                                          enteredValueToCalc.toStringAsFixed(2),
                                          widget.myList[index]);
                                    }
                                  });
                                },
                                child: Text(exchange)),
                            SizedBox(
                              height: 50,
                              width: 170,
                              child: TextFormField(
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9 .]')),
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
                                  if (double.tryParse(value) != null) {
                                    enteredValueToCalc = double.parse(value);
                                  } else {
                                    enteredValueToCalc = 0;
                                  }
                                  setState(() {
                                    calculateResult(
                                        value, widget.myList[index]);
                                  });
                                },
                              ),
                            ),
                          ],
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
                          sonuc.toStringAsFixed(2) +
                              (" " + UIHelper.goldLongtoShort(calc)),
                          style:
                              const TextStyle(fontSize: 30, color: Colors.blue),
                        ),
                      )
                    ],
                  )
                ],
              ));
        });
  }

  double calculateResult(String value, GoldModel args) {
    var n = double.tryParse(value);
    if (n != null) {
      if (calc == " TL") {
        setState(() {
          sonuc = (double.parse(value) * double.parse(getValue(args)));
        });
        return sonuc;
      } else {
        setState(() {});
        sonuc = (double.parse(value) / double.parse(getValue(args)));
        calc = args.cur;
        return sonuc;
      }
    } else {
      return 0;
    }
  }

  String getValue(GoldModel args) {
    if (val == 1) {
      return correctDouble(args.buy);
    } else {
      return correctDouble(args.sell);
    }
  }

  String getValueChangeStatus(String degisim) {
    if (degisim.contains("-")) {
      return "images/downarrow.gif";
    } else {
      return "images/uparrow.gif";
    }
  }

  String correctDouble(String value) {
    var removeDots = value.replaceAll(".", "");
    var replaceComma = removeDots.replaceAll(",", ".");
    return replaceComma;
  }
}

class ScreenArguments {
  final String alis;
  final String satis;

  ScreenArguments(this.alis, this.satis);
}
