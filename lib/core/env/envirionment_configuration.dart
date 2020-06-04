import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class EnvironmentConfiguration {
  static Future run() async {
    const bool isProduction = bool.fromEnvironment('dart.vm.product');
    await DotEnv().load('${isProduction ? "production" : "development"}.env');
    final dotEnv = DotEnv();
    // Initialize parse for consuming API service
    await Parse().initialize(
      dotEnv.env['PARSE_APPLICATION_ID'],
      dotEnv.env['BASE_URL'],
      clientKey: dotEnv.env['PARSE_CLIENT_ID'],
      masterKey: dotEnv.env['PARSE_MASTER_KEY'], // Required for Back4App and others
      autoSendSessionId: true, // Required for authentication and ACL
      debug: true,
    );
  }
}

