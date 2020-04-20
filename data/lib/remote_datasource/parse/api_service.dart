import 'package:data/models/store.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

///Manager that defines all the API service requests.
abstract class ApiService {

  Future<ParseResponse> getAllStores();

}
