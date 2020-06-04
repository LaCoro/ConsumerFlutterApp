/// Order status
class OrderStatus {
  final _value;

  const OrderStatus._internal(this._value);

  static const ORDER_REQUESTED = const OrderStatus._internal('ORDER_REQUESTED');
  static const ORDER_IN_PROGRESS = const OrderStatus._internal('ORDER_IN_PROGRESS');
  static const ORDER_COMPLETED = const OrderStatus._internal('ORDER_COMPLETED');
  static const ORDER_CANCELED = const OrderStatus._internal('ORDER_CANCELED');

  static List<OrderStatus> values = List.of([
    OrderStatus.ORDER_REQUESTED,
    OrderStatus.ORDER_IN_PROGRESS,
    OrderStatus.ORDER_COMPLETED,
    OrderStatus.ORDER_CANCELED,
  ]);

  toString() => '$_value';

  static OrderStatus findOrderStatus(String status) {
    return values.firstWhere((element) => element.toString() == status);
  }
}
