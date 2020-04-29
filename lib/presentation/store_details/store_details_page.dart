import 'package:LaCoro/presentation/core/ui/custom_widgets/cart_total_bottom.dart';
import 'package:domain/entities/item_entity.dart';
import 'package:domain/entities/store_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoreDetailsPage extends StatefulWidget {
  static const STORE_DETAILS_ROUTE = '/store_details';

  @override
  _StoreDetailsPageState createState() => _StoreDetailsPageState();
}

class _StoreDetailsPageState extends State<StoreDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final StoreEntity store = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(title: Text(store.name)),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(flex: 1, child: Center(child: Text(store.name))),
              Center(child: Text(store.searchTags.join('-'))),
              Expanded(flex: 5, child: buildItemList(store.items)),
              CartTotalBottom(0, "\$0"),
            ],
          ),
        ));
  }

  Widget buildItemList(Future<List<ItemEntity>> items) {
    return FutureBuilder<List<ItemEntity>>(
        future: items, // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<List<ItemEntity>> snapshot) {
          final data = snapshot.data;
          return Container(
            color: Colors.black12,
            child: ListView.builder(
                itemExtent: 100.0,
                itemBuilder: (c, i) => GestureDetector(
                      onTap: () => Navigator.pushNamed(context, StoreDetailsPage.STORE_DETAILS_ROUTE, arguments: data[i]),
                      child: Container(
                        height: 100,
                        child: Center(child: Text(data[i].name)),
                        margin: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                itemCount: data?.length ?? 0),
          );
        });
  }
}
