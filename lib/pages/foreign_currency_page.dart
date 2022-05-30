import 'package:altin_fiyatlari/widgets/currency_list.dart';
import 'package:flutter/material.dart';

class ForeignCurrencyPage extends StatefulWidget {
  const ForeignCurrencyPage({Key? key}) : super(key: key);

  @override
  State<ForeignCurrencyPage> createState() => _ForeignCurrencyPageState();
}

class _ForeignCurrencyPageState extends State<ForeignCurrencyPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CurrencyList(),
    );
  }
}
