// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/gold_list_item.dart';

class CalculatePage extends StatefulWidget {
  late String imgPath;
  CalculatePage({Key? key, required this.imgPath}) : super(key: key);

  @override
  State<CalculatePage> createState() => _CalculatePageState();
}

class _CalculatePageState extends State<CalculatePage> {
  String dropdownvalue = "ALIŞ";
  var sonuc = 0.0;
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // Initial Selected Value
    final ScreenArguments args =
        ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    // List of items in our dropdown menu
    var items = ["ALIŞ", "SATIŞ"];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Hesaplama"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(widget.imgPath),
                        fit: BoxFit.cover))),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton(
                  value: dropdownvalue,
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.blue,
                  ),
                  items: items.map((String items) {
                    return DropdownMenuItem(
                        value: items,
                        child: Text(
                          items,
                          style: const TextStyle(color: Colors.blue),
                        ));
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                      _controller.clear();
                      sonuc = 0;
                    });
                  }),
            ),
            SizedBox(
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
                    calculateResult(value, args);
                  });
                },
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
                sonuc.toStringAsFixed(2),
                style: const TextStyle(fontSize: 30, color: Colors.blue),
              ),
            )
          ],
        ),
      ),
    );
  }

  double calculateResult(String value, ScreenArguments args) {
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

  String getValue(ScreenArguments args) {
    if (dropdownvalue == 'ALIŞ') {
      return args.alis;
    } else {
      return args.satis;
    }
  }
}
