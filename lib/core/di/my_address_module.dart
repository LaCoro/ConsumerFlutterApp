import 'package:LaCoro/presentation/adresses/my_address_bloc.dart';
import 'package:domain/use_cases/my_address_use_cases.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

/// City selection module that defines the dependencies needed by the [CitySelectionPage]
class MyAddressModule {
  Injector initialise(Injector injector) {
    // Use cases
    injector.map<MyAddressUseCases>((injector) => MyAddressUseCases(injector.get()));
    // BLoC
    injector.map<MyAddressBloc>((injector) => MyAddressBloc(injector.get(), injector.get()));
    return injector;
  }
}
