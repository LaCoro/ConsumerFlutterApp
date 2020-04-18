import 'package:data/models/store.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class StoreApi {
  Future<List<String>> getAllStroes() async {
    final baseUrl = "https://eladmin.back4app.io";
    final parseApplicationId = "l1zArA6iMMkRJ2sfcn1GLn2SpiHwryyUVNEbOMyR";
    final parseCliendtId = "63DQGTqsiewevm1jrg55eZ0Va4PsuwQPidJGTVXR";

    await Parse().initialize(
      parseApplicationId,
      baseUrl,
      clientKey: parseCliendtId,
      debug: true,
    );

    final response = await ParseObject("Store").getAll();

    return response.results.map((e) => e.get("name") as String).toList();
  }
}
