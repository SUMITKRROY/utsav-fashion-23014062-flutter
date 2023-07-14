part of 'address_bloc.dart';

@immutable
abstract class AddressState {}

class AddressInitial extends AddressState {}
class AddressLoading extends AddressState {}
class AddressSuccess extends AddressState {
    Map<String, dynamic> addressMapdata;
  AddressSuccess(this.addressMapdata);
}
class AddressFailure extends AddressState {}
