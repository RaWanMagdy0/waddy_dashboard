import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:waddy_dashboard/home/data/home_data_source/data_source/add_order_data_source/add_order_data_source.dart';
import 'package:waddy_dashboard/home/domain/entity/add_order.dart';

@Injectable(as: OrderRemoteDataSource)
class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  final FirebaseFirestore firestore;

  OrderRemoteDataSourceImpl(this.firestore);

  @override
  Future<void> createOrder(AddOrder order) async {
    await firestore.collection('orders').add({
      'name': order.clinteName,
      'phone': order.phone,
      'address': order.address,
      'weight': order.weight,
      'price': order.price,
      'paymentMethod': order.paymentMethod,
      'orderType': order.orderType,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }
}
