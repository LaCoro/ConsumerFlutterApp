import 'package:LaCoro/presentation/store_list/store_list_bloc.dart';
import 'package:LaCoro/presentation/store_list/store_list_page.dart';
import 'package:domain/use_cases/store_use_cases.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

/// Store list module that defines the dependencies needed by the [StoreListPage]
class StoreListModule {
  Injector initialise(Injector injector)  {
    // Use cases
    injector.map<StoreUseCases>((injector) => StoreUseCases(injector.get()));
    // BLoC
    injector.map<StoreListBloc>((injector) => StoreListBloc(injector.get(), injector.get()));
    return injector;
  }
}
