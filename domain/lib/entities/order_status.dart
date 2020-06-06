/// Order status
class OrderStatus {
  final value;
  final index;

  const OrderStatus._internal(this.value, this.index);

  static const ORDER_PLACED = const OrderStatus._internal('ORDER_PLACED', 0);
  static const ORDER_IN_PROGRESS = const OrderStatus._internal('ORDER_IN_PROGRESS', 1);
  static const ORDER_COMPLETED = const OrderStatus._internal('ORDER_COMPLETED', 2);
  static const ORDER_CANCELED = const OrderStatus._internal('ORDER_CANCELED', 3);

  static List<OrderStatus> values = List.of([
    OrderStatus.ORDER_PLACED,
    OrderStatus.ORDER_IN_PROGRESS,
    OrderStatus.ORDER_COMPLETED,
    OrderStatus.ORDER_CANCELED,
  ]);

  toString() => '$value';

  static OrderStatus findOrderStatus(String status) {
    return values.firstWhere((element) => element.toString() == status);
  }
}
