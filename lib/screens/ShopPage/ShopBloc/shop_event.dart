part of 'shop_bloc.dart';

@immutable
abstract class ShopEvent {}

class ShopEventHandler extends ShopEvent {
  final String storeId;
  final String currencyCode;
  final String searchCriteria;
  final String pageSize;
  final String currentPage;
  final String conditionType;
  final String field;
  final String value;
  final String direction;

  ShopEventHandler(
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
class ShipInFilterdata extends ShopEvent {
    String token;
    ShipInFilterdata(this.token,);
}
