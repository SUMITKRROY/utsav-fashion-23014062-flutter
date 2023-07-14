part of 'account_bloc.dart';

@immutable
abstract class AccountEvent {}

class AccountEventHandler extends AccountEvent{

  String name;
  AccountEventHandler(this.name);
}