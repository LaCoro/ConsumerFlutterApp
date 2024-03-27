// @dart=2.9
import 'package:equatable/equatable.dart';

/// A generic class to handle the result for each transaction.
abstract class Result {}

class Success<T> extends Equatable implements Result {
  final T data;

  Success(this.data);

  @override
  List<Object> get props => [data];
}

class Failure extends Equatable implements Result {
  final Exception exception;

  Failure({this.exception});

  @override
  List<Object> get props => [exception];
}
