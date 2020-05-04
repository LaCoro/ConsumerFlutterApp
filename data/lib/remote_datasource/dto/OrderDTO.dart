import 'package:data/models/item.dart';
import 'package:data/models/order.dart';

class OrderDTO {
  final Order order;
  final Map<Item, int> products; // {Product, Quantity}
  final String notes;

  OrderDTO(this.order, this.products, {this.notes});
}
