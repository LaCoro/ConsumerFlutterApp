import 'package:data/remote_datasource/api/parse/api_service.dart';
import 'package:data/remote_datasource/api/parse/api_service_impl.dart';
import 'package:data/remote_datasource/api/store_api.dart';
import 'package:data/repositories/store_repository_impl.dart';
import 'package:domain/repositories/store_repository.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

/// App module that defines all modules to be injected in the app
class AppModule {
  Future<Injector> initialise(Injector injector) async {
    // Environment settings
    await _setCurrentEnvironment();
    // Api
    injector.map<ApiService>((injector) => ApiServiceImpl(), isSingleton: true);
    injector.map<StoreApi>((injector) => StoreApi(injector.get()));
    // Repository
    injector.map<StoreRepository>((injector) => StoreRepositoryImpl(injector.get()));

//    injector.mapWithParams<SomeOtherType>((i, p) => SomeOtherType(p['id']));
    return injector;
  }

  Future _setCurrentEnvironment() async {
    const bool isProduction = bool.fromEnvironment('dart.vm.product');
    await DotEnv().load('${isProduction ? "production" : "development"}.env');
    final dotEnv = DotEnv();
    // Initialize parse for consuming API service
    await Parse().initialize(
      dotEnv.env["PARSE_APPLICATION_ID"],
      dotEnv.env["BASE_URL"],
      clientKey: dotEnv.env["PARSE_CLIENT_ID"],
      debug: true,
    );
  }
}
