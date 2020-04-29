import 'package:LaCoro/presentation/core/ui/custom_widgets/cart_total_bottom.dart';
import 'package:LaCoro/presentation/product_item/product_item.dart';
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
              Expanded(flex: 1, child: Text(store.name)),
              Center(child: Text(store.searchTags.join('-'))),
              Expanded(flex: 5, child: buildItemList(store.items)),
              CartTotalBottom(0, "\$0"),
            ],
          ),
        ));
  }

  Widget buildItemList(Future<List<ItemEntity>> items) {
    return FutureBuilder<List<ItemEntity>>(
        initialData: null,
        future: items, // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<List<ItemEntity>> snapshot) {
          final data = snapshot.data;
          return data == null
              ? Center(child: CircularProgressIndicator())
              : ListView.separated(
                  separatorBuilder: (BuildContext context, int index) => Divider(),
                  itemBuilder: (c, i) => ProductItem(itemEntity: data[i]),
                  itemCount: data?.length ?? 0);
        });
  }
}
