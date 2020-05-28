import 'package:LaCoro/core/preferences/preferences.dart';
import 'package:LaCoro/presentation/adresses/my_address_bloc.dart';
import 'package:LaCoro/presentation/order_detail/order_details_bloc.dart';
import 'package:LaCoro/presentation/register/register_bloc.dart';
import 'package:LaCoro/presentation/store_details/store_details_bloc.dart';
import 'package:LaCoro/presentation/store_list/store_list_bloc.dart';
import 'package:data/remote_datasource/api/city_api.dart';
import 'package:data/remote_datasource/api/parse/api_service.dart';
import 'package:data/remote_datasource/api/parse/api_service_impl.dart';
import 'package:data/remote_datasource/api/profile_api.dart';
import 'package:data/remote_datasource/api/store_api.dart';
import 'package:data/repositories/city_repository_impl.dart';
import 'package:data/repositories/profile_repository_impl.dart';
import 'package:data/repositories/store_repository_impl.dart';
import 'package:domain/repositories/city_repository.dart';
import 'package:domain/repositories/profile_repository.dart';
import 'package:domain/repositories/store_repository.dart';
import 'package:domain/use_cases/my_address_use_cases.dart';
import 'package:domain/use_cases/profile_use_cases.dart';
import 'package:domain/use_cases/store_use_cases.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

/// App module that defines the generic modules to be injected in the app
class AppModule {
  Future<Injector> initialise(Injector injector) async {
    await _setCurrentEnvironment();

    final preferences = await Preferences().init();
    injector.map<Preferences>((injector) => preferences, isSingleton: true);
    // Api
    injector.map<ApiService>((injector) => ApiServiceImpl(), isSingleton: true);
    injector.map<StoreApi>((injector) => StoreApi(injector.get()));
    injector.map<CityApi>((injector) => CityApi(injector.get()));
    injector.map<ProfileApi>((injector) => ProfileApi(injector.get()));
    // Repository
    injector.map<StoreRepository>((injector) => StoreRepositoryImpl(injector.get()));
    injector.map<CityRepository>((injector) => CityRepositoryImpl(injector.get()));
    injector.map<ProfileRepository>((injector) => ProfileRepositoryImpl(injector.get()));
    // Use case
    injector.map<MyAddressUseCases>((injector) => MyAddressUseCases(injector.get()));
    injector.map<StoreUseCases>((injector) => StoreUseCases(injector.get()));
    injector.map<ProfileUseCases>((injector) => ProfileUseCases(injector.get()));
    // BLoC
    injector.map<MyAddressBloc>((injector) => MyAddressBloc(injector.get(), injector.get()));
    injector.map<StoreListBloc>((injector) => StoreListBloc(injector.get(), injector.get()));
    injector.map<StoreDetailsBloc>((injector) => StoreDetailsBloc(injector.get()));
    injector.map<OrderDetailsBloc>((injector) => OrderDetailsBloc(injector.get(), injector.get()));
    injector.map<RegisterBloc>((injector) => RegisterBloc(injector.get(), injector.get()));
    return injector;
  }

  Future _setCurrentEnvironment() async {
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
