import 'package:waddy_dashboard/home/domain/entity/add_order.dart';

abstract class OrderRemoteDataSource {
  Future<void> createOrder(AddOrder order);
}
