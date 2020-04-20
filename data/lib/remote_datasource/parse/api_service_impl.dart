import 'package:data/remote_datasource/parse/api_service.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

///Manager that defines all the API service requests.
class ApiServiceImpl extends ApiService {

  final baseUrl = "https://parseapi.back4app.com";
  final parseApplicationId = "5IgxoMa1l6QoEJodtOXcQmXCmZF61S4yGbhhXLE5";
  final parseClientKey = "WGk3ukWHINv5yrGAqizMSCyj6otKJskhP7COIpVz";

  ApiServiceImpl() {
    Parse().initialize(
      parseApplicationId,
      baseUrl,
      clientKey: parseClientKey,
      debug: true,
    );
  }

  @override
  Future<ParseResponse> getAllStores() => ParseObject("Store").getAll();

}
