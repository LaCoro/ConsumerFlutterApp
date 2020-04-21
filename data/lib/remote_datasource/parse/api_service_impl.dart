import 'package:data/models/store.dart';
import 'package:data/remote_datasource/parse/api_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

///Manager that defines all the API service requests.
class ApiServiceImpl extends ApiService {
  final DotEnv _dotEnv;

  ApiServiceImpl(this._dotEnv) {
    // Initialize Parse to establish communication with the server
    Parse().initialize(
      _dotEnv.env["PARSE_APPLICATION_ID"],
      _dotEnv.env["BASE_URL"],
      clientKey: _dotEnv.env["PARSE_CLIENT_ID"],
      debug: true,
    );
  }

  @override
  Future<ParseResponse> getAllStores() async {
    await Parse().initialize(
      _dotEnv.env["PARSE_APPLICATION_ID"],
      _dotEnv.env["BASE_URL"],
      clientKey: _dotEnv.env["PARSE_CLIENT_ID"],
      debug: true,
    );
    return Store().getAll();
  }
}
