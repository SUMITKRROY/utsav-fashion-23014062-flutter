part of 'shopping_bloc.dart';

@immutable
abstract class ShoppingState {}

class ShoppingInitial extends ShoppingState {}
class ShoppingSuccess extends ShoppingState {

  final AddToModel addToModel;
  ShoppingSuccess(this.addToModel);
}
class ShoppingFailure extends ShoppingState {}
class ShoppingError extends ShoppingState {}
///
class ViewDetailsInitial extends ShoppingState {}
class ViewDetailsSuccess extends ShoppingState {

  // final AddToModel addToModel;
  final Map<String,dynamic> addToModel;
  ViewDetailsSuccess(this.addToModel);
}
class ViewDetailsFailure extends ShoppingState {}
///