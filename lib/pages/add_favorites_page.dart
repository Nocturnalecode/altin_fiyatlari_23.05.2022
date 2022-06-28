import 'package:flutter/material.dart';
import '../models/merged_model.dart';
import '../services/merged_api.dart';
import '../widgets/favorites_list_item.dart';

class AddFavoritesPage extends StatefulWidget {
  const AddFavoritesPage(BuildContext context, {Key? key}) : super(key: key);

  @override
  State<AddFavoritesPage> createState() => _AddFavoritesPageState();
}

class _AddFavoritesPageState extends State<AddFavoritesPage> {
  late Future<List<MergedModel>> _mergedListFuture;
  late List<MergedModel> _listem;

  @override
  void initState() {
    super.initState();
    _mergedListFuture = MergedApi.getCurrencyData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("<< Geri")),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                flex: 20,
                child: SizedBox(
                  child: FutureBuilder<List<MergedModel>>(
                    future: _mergedListFuture,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        _listem = snapshot.data!;
                        return GridView.builder(
                            itemCount: _listem.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10,
                                    crossAxisCount: 4),
                            itemBuilder: (context, index) => FavoritesListItem(
                                  mergedList: _listem[index],
                                ));
                      } else if (snapshot.hasError) {
                        return const Center(
                          child: Text("Hata Çıktı"),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
