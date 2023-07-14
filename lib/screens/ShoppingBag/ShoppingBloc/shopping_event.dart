part of 'shopping_bloc.dart';

@immutable
abstract class ShoppingEvent {}




class AddtoCartEvent extends ShoppingEvent {
  final String storeId;
  final String currencyCode;
  final String searchCriteria;
  final String pageSize;
  final String currentPage;
  final String conditionType;
  final String field;
  final String value;
  final String direction;

  AddtoCartEvent(
      this.storeId,
      this.currencyCode,
      this.searchCriteria,
      this.pageSize,
      this.currentPage,
      this.conditionType,
      this.field,
      this.value,
      this.direction);
}
class ViewDetailsCartEvent extends ShoppingEvent {
  

  ViewDetailsCartEvent(
       );
}