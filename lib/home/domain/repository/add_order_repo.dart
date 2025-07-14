import 'package:waddy_dashboard/home/domain/entity/add_order.dart';

abstract class OrderRepository {
  Future<void> createOrder(AddOrder order);
}
