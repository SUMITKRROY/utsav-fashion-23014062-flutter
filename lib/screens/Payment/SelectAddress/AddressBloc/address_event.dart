part of 'address_bloc.dart';

@immutable
abstract class AddressEvent {}


class AddressEventHandler extends AddressEvent{

  String token;
  AddressEventHandler(this.token);
}