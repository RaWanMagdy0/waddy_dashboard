import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:waddy_dashboard/home/domain/entity/add_order.dart';
import 'package:waddy_dashboard/home/domain/repository/add_order_repo.dart';
import 'package:waddy_dashboard/home/presentation/add_order/view_model/add_order_state.dart';

@injectable
class AddOrderCubit extends Cubit<AddOrderState> {
  final OrderRepository repository;

  @factoryMethod
  AddOrderCubit(this.repository) : super(AddOrderInitial());
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final weightController = TextEditingController();
  final priceController = TextEditingController();
  final paymentController = TextEditingController();
  final typeController = TextEditingController();
  final noteController = TextEditingController();

  void disposeControllers() {
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    weightController.dispose();
    priceController.dispose();
    paymentController.dispose();
    typeController.dispose();
  }

  AddOrder buildOrderEntity() {
    return AddOrder(
      clinteName: nameController.text,
      phone: phoneController.text,
      address: addressController.text,
      weight: double.tryParse(weightController.text) ?? 0.0,
      price: double.tryParse(priceController.text) ?? 0.0,
      paymentMethod: paymentController.text,
      orderType: typeController.text,
      note: noteController.text,
    );
  }

  Future<void> createOrder() async {
    emit(AddOrderLoading());
    try {
      final order = buildOrderEntity();
      await repository.createOrder(order);
      emit(AddOrderSuccess());
    } catch (e) {
      emit(AddOrderFailure(e.toString()));
    }
  }
}
