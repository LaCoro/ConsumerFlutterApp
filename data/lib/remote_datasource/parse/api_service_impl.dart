import 'package:data/models/store.dart';
import 'package:data/remote_datasource/parse/api_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

///Manager that defines all the API service requests.
class ApiServiceImpl extends ApiService {
  static const parseApplicationIdKey = "PARSE_APPLICATION_ID";
  static const baseUrlKey = "BASE_URL";
  static const parseClientIdKey = "PARSE_CLIENT_ID";

  final DotEnv _dotEnv;

  ApiServiceImpl(this._dotEnv) {
    // Initialize Parse to establish communication with the server
    Parse().initialize(
      _dotEnv.env[parseApplicationIdKey],
      _dotEnv.env[baseUrlKey],
      clientKey: _dotEnv.env[parseClientIdKey],
      debug: true,
    );
  }

  @override
  Future<ParseResponse> getAllStores() => Store().getAll();
}
