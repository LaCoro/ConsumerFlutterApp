import 'package:data/remote_datasource/api/store_api.dart';
import 'package:data/remote_datasource/parse/api_service.dart';
import 'package:data/remote_datasource/parse/api_service_impl.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

/// App module that defines all modules to be injected in the app
class AppModule {
  
  Future<Injector> initialise(Injector injector) async {
    // Environment settings
    await _setCurrentEnvironment();
    injector.map<DotEnv>((_) => DotEnv(), isSingleton: true);
    // Api
    injector.map<ApiService>((injector) => ApiServiceImpl(injector.get()), isSingleton: true);
    injector.map<StoreApi>((injector) => StoreApi(injector.get()));
//    injector.mapWithParams<SomeOtherType>((i, p) => SomeOtherType(p['id']));
    return injector;
  }

  
  Future _setCurrentEnvironment() async {
    const bool isProduction = bool.fromEnvironment('dart.vm.product');
    await DotEnv().load('${isProduction ? "production" : "development"}.env');
  }
}
