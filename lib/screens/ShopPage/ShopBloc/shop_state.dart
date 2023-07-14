part of 'shop_bloc.dart';

@immutable
abstract class ShopState {}

class ShopInitial extends ShopState {}


class SuccessLoading extends ShopState {


}
class SuccessData extends ShopState {
  final List<dynamic> shipindata;
  // final ProdRendInfoModel prodRendInfoModel;
  SuccessData(this.shipindata);
}

class FailureData extends ShopState {

  String? error;

  FailureData(this.error);

}