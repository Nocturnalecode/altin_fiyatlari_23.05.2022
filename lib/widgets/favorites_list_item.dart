import 'package:altin_fiyatlari/UIHelper/ui_helper.dart';
import 'package:flutter/material.dart';
import '../models/merged_model.dart';

class FavoritesListItem extends StatelessWidget {
  final MergedModel mergedList;
  const FavoritesListItem({Key? key, required this.mergedList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context, mergedList.cur);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 3,
        shadowColor: Colors.grey,
        color: Colors.blueGrey,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                UIHelper.getStringFromStringCurrency(mergedList.cur),
                style: const TextStyle(color: Colors.amber),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
