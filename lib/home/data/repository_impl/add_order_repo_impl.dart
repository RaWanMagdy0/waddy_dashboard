import 'package:injectable/injectable.dart';
import 'package:waddy_dashboard/home/data/home_data_source/data_source/add_order_data_source/add_order_data_source.dart';
import 'package:waddy_dashboard/home/domain/entity/add_order.dart';
import 'package:waddy_dashboard/home/domain/repository/add_order_repo.dart';

@Injectable(as: OrderRepository)
class OrderRepositoryImpl implements OrderRepository {
  final OrderRemoteDataSource remoteDataSource;

  OrderRepositoryImpl(this.remoteDataSource);

  @override
  Future<void> createOrder(AddOrder order) {
    return remoteDataSource.createOrder(order);
  }
}
