class AddOrder {
  final String clinteName;
  final String phone;
  final String address;
  final double weight;
  final double price;
  final String paymentMethod;
  final String orderType;
  final String note;

  AddOrder({
    required this.clinteName,
    required this.phone,
    required this.address,
    required this.weight,
    required this.price,
    required this.paymentMethod,
    required this.orderType,
    required this.note,
  });
}
