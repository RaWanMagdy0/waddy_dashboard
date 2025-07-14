abstract class AddOrderState {}

class AddOrderInitial extends AddOrderState {}

class AddOrderLoading extends AddOrderState {}

class AddOrderSuccess extends AddOrderState {}

class AddOrderFailure extends AddOrderState {
  final String message;

  AddOrderFailure(this.message);
}
