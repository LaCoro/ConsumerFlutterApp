import 'package:equatable/equatable.dart';

/// Base class represent the states in the BLoC pattern
abstract class BaseState extends Equatable {
  final List<Object> properties;

  BaseState([this.properties]) : super();

  @override
  List<Object> get props => [this.properties];
}

/// Generic states
class InitialState extends BaseState {}

class LoadingState extends BaseState {
  final int progress;

  LoadingState({this.progress}) : super([progress]);
}

class SuccessState<T> extends BaseState {
  final T data;

  SuccessState({this.data}) : super([data]);
}

class ErrorState extends BaseState {
  final String message;

  ErrorState({this.message = "Something went wrong. Please try again later."}) : super([message]);
}

/// Base class represent the events in the BLoC pattern
abstract class BaseEvent extends Equatable {
  final List<Object> properties;

  BaseEvent([this.properties]) : super();

  @override
  List<Object> get props => [this.properties];
}
