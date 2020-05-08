import 'package:LaCoro/presentation/city_selection/city_selection_bloc.dart';
import 'package:LaCoro/presentation/city_selection/city_selection_page.dart';
import 'package:domain/use_cases/city_use_cases.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

/// City selection module that defines the dependencies needed by the [CitySelectionPage]
class CitySelectionModule {
  Injector initialise(Injector injector) {
    // Use cases
    injector.map<CityUseCases>((injector) => CityUseCases(injector.get()));
    // BLoC
    injector.map<CitySelectionBloc>((injector) => CitySelectionBloc(injector.get(), injector.get()));
    return injector;
  }
}
