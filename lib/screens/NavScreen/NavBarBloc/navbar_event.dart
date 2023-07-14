part of 'navbar_bloc.dart';

@immutable
abstract class NavbarEvent {}
class NavbarEventHandler extends NavbarEvent {
  final String userID;
  final String companyID;
  final String apikey;
  final String tradeShowID;

  NavbarEventHandler(this.userID,this.companyID,this.apikey, this.tradeShowID,);
}