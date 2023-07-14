part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}
class HomeEventUrlKey extends HomeEvent{


  String token;
  HomeEventUrlKey( this.token);
}
class HomeCategories extends HomeEvent{

  String token;
  HomeCategories( this.token);
}


class HomeScreenHandler extends HomeEvent{
  String token;
  HomeScreenHandler(this.token);
}
class NostoApiSimilarProductHome extends HomeEvent{
  String token;
  NostoApiSimilarProductHome(this.token);
}
class ReadyToShipCMSbloc extends HomeEvent{
  String token;
  ReadyToShipCMSbloc(this.token);
}
class WhatnowCMSbloc extends HomeEvent{
  String token;
  WhatnowCMSbloc(this.token);
}
class FashionstoryCMSbloc extends HomeEvent{
  String token;
  FashionstoryCMSbloc(this.token);
}
class TrendsCMSbloc extends HomeEvent{
  String token;
  TrendsCMSbloc(this.token);
}
class PlusSizeCMSbloc extends HomeEvent{
  String token;
  PlusSizeCMSbloc(this.token);
}
class WeddinfShopCMSbloc extends HomeEvent{
  String token;
  WeddinfShopCMSbloc(this.token);
}
class TrendsWeLoveCMSbloc extends HomeEvent{
  String token;
  TrendsWeLoveCMSbloc(this.token);
}
class MypersonalStoreCMSbloc extends HomeEvent{
  String token;
  MypersonalStoreCMSbloc(this.token);
}