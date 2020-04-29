import 'package:domain/entities/store_entity.dart';
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

    return Scaffold(body: Center(child: Text(store.name)));
  }
}
